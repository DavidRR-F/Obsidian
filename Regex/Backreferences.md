# Using Backreferences To Match The Same Text Again

![](https://www.regular-expressions.info/img/bulb.png)

Backreferences match the same text as previously matched by a capturing group. Suppose you want to match a pair of opening and closing HTML tags, and the text in between. By putting the opening tag into a backreference, we can reuse the name of the tag for the closing tag. Here’s how: <([A-Z][A-Z0-9]*)\b[^>]*>.*?</\1>. This regex contains only one pair of parentheses, which capture the string matched by [A-Z][A-Z0-9]*. This is the opening HTML tag. (Since HTML tags are case insensitive, this regex requires case insensitive matching.) The backreference \1 (backslash one) references the first capturing group. \1 matches the exact same text that was matched by the first capturing group. The / before it is a literal character. It is simply the forward slash in the closing HTML tag that we are trying to match.

To figure out the number of a particular backreference, scan the regular expression from left to right. Count the opening parentheses of all the numbered capturing groups. The first parenthesis starts backreference number one, the second number two, etc. Skip parentheses that are part of other syntax such as non-capturing groups. This means that non-capturing parentheses have another benefit: you can insert them into a regular expression without changing the numbers assigned to the backreferences. This can be very useful when modifying a complex regular expression.

You can reuse the same backreference more than once. ([a-c])x\1x\1 matches axaxa, bxbxb and cxcxc.

Most regex flavors support up to 99 capturing groups and double-digit backreferences. So \99 is a valid backreference if your regex has 99 capturing groups.

## Looking Inside The Regex Engine

Let’s see how the regex engine applies the regex <([A-Z][A-Z0-9]*)\b[^>]*>.*?</\1> to the string Testing <B><I>bold italic</I></B> text. The first token in the regex is the literal <. The regex engine traverses the string until it can match at the first < in the string. The next token is [A-Z]. The regex engine also takes note that it is now inside the first pair of capturing parentheses. [A-Z] matches B. The engine advances to [A-Z0-9] and >. This match fails. However, because of the [star](https://www.regular-expressions.info/repeat.html), that’s perfectly fine. The position in the string remains at >. The [word boundary](https://www.regular-expressions.info/wordboundaries.html) \b matches at the > because it is preceded by B. The word boundary does not make the engine advance through the string. The position in the regex is advanced to [^>].

This step crosses the closing bracket of the first pair of capturing parentheses. This prompts the regex engine to store what was matched inside them into the first backreference. In this case, B is stored.

After storing the backreference, the engine proceeds with the match attempt. [^>] does not match >. Again, because of another star, this is not a problem. The position in the string remains at >, and position in the regex is advanced to >. These obviously match. The next token is a dot, repeated by a lazy star. Because of the laziness, the regex engine initially skips this token, taking note that it should backtrack in case the remainder of the regex fails.

The engine has now arrived at the second < in the regex, and the second < in the string. These match. The next token is /. This does not match I, and the engine is forced to backtrack to the dot. The dot matches the second < in the string. The star is still lazy, so the engine again takes note of the available backtracking position and advances to < and I. These do not match, so the engine again backtracks.

The backtracking continues until the dot has consumed <I>bold italic. At this point, < matches the third < in the string, and the next token is / which matches /. The next token is \1. Note that the token is the backreference, and not B. The engine does not substitute the backreference in the regular expression. Every time the engine arrives at the backreference, it reads the value that was stored. This means that if the engine had backtracked beyond the first pair of capturing parentheses before arriving the second time at \1, the new value stored in the first backreference would be used. But this did not happen here, so B it is. This fails to match at I, so the engine backtracks again, and the dot consumes the third < in the string.

Backtracking continues again until the dot has consumed <I>bold italic</I>. At this point, < matches < and / matches /. The engine arrives again at \1. The backreference still holds B. \1 matches B. The last token in the regex, > matches >. A complete match has been found: <B><I>bold italic</I></B>.

## Backtracking Into Capturing Groups

You may have wondered about the word boundary \b in the <([A-Z][A-Z0-9]*)\b[^>]*>.*?</\1> mentioned above. This is to make sure the regex won’t match incorrectly paired tags such as <boo>bold</b>. You may think that cannot happen because the capturing group matches boo which causes \1 to try to match the same, and fail. That is indeed what happens. But then the regex engine backtracks.

Let’s take the regex <([A-Z][A-Z0-9]*)[^>]*>.*?</\1> without the word boundary and look inside the regex engine at the point where \1 fails the first time. First, .*? continues to expand until it has reached the end of the string, and </\1> has failed to match each time .*? matched one more character.

Then the regex engine backtracks into the capturing group. [A-Z0-9]* has matched oo, but would just as happily match o or nothing at all. When backtracking, [A-Z0-9]* is forced to give up one character. The regex engine continues, exiting the capturing group a second time. Since [A-Z][A-Z0-9]* has now matched bo, that is what is stored into the capturing group, overwriting boo that was stored before. [^>]* matches the second o in the opening tag. >.*?</ matches >bold</. \1 fails again.

The regex engine does all the same backtracking once more, until [A-Z0-9]* is forced to give up another character, causing it to match nothing, which the [star](https://www.regular-expressions.info/repeat.html) allows. The capturing group now stores just b. [^>]* now matches oo. >.*?</ once again matches >bold<. \1 now succeeds, as does > and an overall match is found. But not the one we wanted.

There are several solutions to this. One is to use the word boundary. When [A-Z0-9]* backtracks the first time, reducing the capturing group to bo, \b fails to match between o and o. This forces [A-Z0-9]* to backtrack again immediately. The capturing group is reduced to b and the word boundary fails between b and o. There are no further backtracking positions, so the whole match attempt fails.

The reason we need the word boundary is that we’re using [^>]* to skip over any attributes in the tag. If your paired tags never have any attributes, you can leave that out, and use <([A-Z][A-Z0-9]*)>.*?</\1>. Each time [A-Z0-9]* backtracks, the > that follows it fails to match, quickly ending the match attempt.

If you don’t want the regex engine to backtrack into capturing groups, you can use an atomic group. The tutorial section on [atomic grouping](https://www.regular-expressions.info/atomic.html) has all the details.

## Repetition and Backreferences

As I mentioned in the above inside look, the regex engine does not permanently substitute backreferences in the regular expression. It will use the last match saved into the backreference each time it needs to be used. If a new match is found by capturing parentheses, the previously saved match is overwritten. There is a [clear difference](https://www.regular-expressions.info/captureall.html) between ([abc]+) and ([abc])+. Though both successfully match cab, the first regex will put cab into the first backreference, while the second regex will only store b. That is because in the second regex, the plus caused the pair of parentheses to repeat three times. The first time, c was stored. The second time, a, and the third time b. Each time, the previous value was overwritten, so b remains.

This also means that ([abc]+)=\1 will match cab=cab, and that ([abc])+=\1 will not. The reason is that when the engine arrives at \1, it holds b which fails to match c. Obvious when you look at a simple example like this one, but a common cause of difficulty with regular expressions nonetheless. When using backreferences, always double check that you are really capturing what you want.

## Useful Example: Checking for Doubled Words

When editing text, doubled words such as “the the” easily creep in. Using the regex \b(\w+)\s+\1\b in your [text editor](https://www.regular-expressions.info/editpadpro.html), you can easily find them. To delete the second word, simply type in \1 as the replacement text and click the Replace button.

### Parentheses and Backreferences Cannot Be Used Inside Character Classes

Parentheses cannot be used inside [character classes](https://www.regular-expressions.info/charclass.html), at least not as metacharacters. When you put a parenthesis in a character class, it is treated as a literal character. So the regex [(a)b] matches a, b, (, and ).

Backreferences, too, cannot be used inside a character class. The \1 in a regex like (a)[\1b] is either an error or a needlessly escaped literal 1. In [JavaScript](https://www.regular-expressions.info/javascript.html) it’s an [octal escape](https://www.regular-expressions.info/nonprint.html#octal).

# Backreferences to Failed Groups

![](https://www.regular-expressions.info/img/bulb.png)

The previous topic on [backreferences](https://www.regular-expressions.info/backref.html) applies to all regex flavors, except those few that don’t support backreferences at all. Flavors behave differently when you start doing things that don’t fit the “match the text matched by a previous capturing group” job description.

There is a difference between a backreference to a capturing group that matched nothing, and one to a capturing group that did not participate in the match at all. The regex (q?)b\1 matches b. q? is optional and matches nothing, causing (q?) to successfully match and capture nothing. b matches b and \1 successfully matches the nothing captured by the group.

In most flavors, the regex (q)?b\1 fails to match b. (q) fails to match at all, so the group never gets to capture anything at all. Because the whole group is optional, the engine does proceed to match b. The engine now arrives at \1 which references a group that did not participate in the match attempt at all. This causes the backreference to fail to match at all, mimicking the result of the group. Since there’s no ? making \1 optional, the overall match attempt fails.

One of the few exceptions is [JavaScript](https://www.regular-expressions.info/javascript.html). According to the official ECMA standard, a backreference to a non-participating capturing group must successfully match nothing just like a backreference to a participating group that captured nothing does. In other words, in JavaScript, (q?)b\1 and (q)?b\1 both match b. [XPath](https://www.regular-expressions.info/xpath.html) also works this way.

Dinkumware’s implementation of [std::regex](https://www.regular-expressions.info/stdregex.html) handles backreferences like JavaScript for all its grammars that support backreferences. [Boost](https://www.regular-expressions.info/boost.html) did so too until version 1.46. As of version 1.47, Boost fails backreferences to non-participating groups when using the ECMAScript grammar, but still lets them successfully match nothing when using the basic and grep grammars.

## Backreferences to Non-Existent Capturing Groups

Backreferences to groups that do not exist, such as (one)\7, are an error in most regex flavors. There are exceptions though. [JavaScript](https://www.regular-expressions.info/javascript.html) treats \1 through \7 as [octal escapes](https://www.regular-expressions.info/characters.html#octal) when there are fewer capturing groups in the regex than the digit after the backslash. \8 and \9 are an error because 8 and 9 are not valid octal digits.

[Java](https://www.regular-expressions.info/java.html) treats backreferences to groups that don’t exist as backreferences to groups that exist but never participate in the match. They are not an error, but simply never match anything.

[.NET](https://www.regular-expressions.info/dotnet.html) is a little more complicated. .NET supports single-digit and double-digit backreferences as well as double-digit octal escapes without a leading zero. Backreferences trump octal escapes. So \12 is a line feed (octal 12 = decimal 10) in a regex with fewer than 12 capturing groups. It would be a backreference to the 12th group in a regex with 12 or more capturing groups. .NET does not support single-digit octal escapes. So \7 is an error in a regex with fewer than 7 capturing groups.

## Forward References

Many modern regex flavors, including [JGsoft](https://www.regular-expressions.info/jgsoft.html), [.NET](https://www.regular-expressions.info/dotnet.html), [Java](https://www.regular-expressions.info/java.html), [Perl](https://www.regular-expressions.info/perl.html), [PCRE](https://www.regular-expressions.info/pcre.html), [PHP](https://www.regular-expressions.info/php.html), [Delphi](https://www.regular-expressions.info/delphi.html), and [Ruby](https://www.regular-expressions.info/ruby.html) allow forward references. They allow you to use a backreference to a group that appears later in the regex. Forward references are obviously only useful if they’re inside a repeated group. Then there can be situations in which the regex engine evaluates the backreference after the group has already matched. Before the group is attempted, the backreference fails like a backreference to a failed group does.

If forward references are supported, the regex (\2two|(one))+ matches oneonetwo. At the start of the string, \2 fails. Trying the other [alternative](https://www.regular-expressions.info/alternation.html), one is matched by the second capturing group, and subsequently by the first group. The first group is then repeated. This time, \2 matches one as captured by the second group. two then matches two. With two repetitions of the first group, the regex has matched the whole subject string.

[JavaScript](https://www.regular-expressions.info/javascript.html) does not support forward references, but does not treat them as an error. In JavaScript, forward references always find a zero-length match, just as backreferences to non-participating groups do in JavaScript. Because this is not particularly useful, [XRegExp](https://www.regular-expressions.info/xregexp.html) makes them an error. In [std::regex](https://www.regular-expressions.info/stdregex.html), [Boost](https://www.regular-expressions.info/boost.html), [Python](https://www.regular-expressions.info/python.html), [Tcl](https://www.regular-expressions.info/tcl.html), and [VBScript](https://www.regular-expressions.info/vbscript.html) forward references are an error.

## Nested References

A nested reference is a backreference inside the capturing group that it references. Like forward references, nested references are only useful if they’re inside a repeated group, as in (\1two|(one))+. When nested references are supported, this regex also matches oneonetwo. At the start of the string, \1 fails. Trying the other [alternative](https://www.regular-expressions.info/alternation.html), one is matched by the second capturing group, and subsequently by the first group. The first group is then repeated. This time, \1 matches one as captured by the last iteration of the first group. It doesn’t matter that the regex engine has re-entered the first group. The text matched by the group was stored into the backreference when the group was previously exited. two then matches two. With two repetitions of the first group, the regex has matched the whole subject string. If you retrieve the text from the capturing groups after the match, the first group stores onetwo while the second group captured the first occurrence of one in the string.

The [JGsoft](https://www.regular-expressions.info/jgsoft.html), [.NET](https://www.regular-expressions.info/dotnet.html), [Java](https://www.regular-expressions.info/java.html), [Perl](https://www.regular-expressions.info/perl.html), and [VBScript](https://www.regular-expressions.info/vbscript.html) flavors all support nested references. [PCRE](https://www.regular-expressions.info/pcre.html) does too, but had bugs with backtracking into capturing groups with nested backreferences. Instead of fixing the bugs, PCRE 8.01 worked around them by forcing capturing groups with nested references to be [atomic](https://www.regular-expressions.info/atomic.html). So in PCRE, (\1two|(one))+ is the same as (?>(\1two|(one)))+. This affects languages with regex engines based on PCRE, such as [PHP](https://www.regular-expressions.info/php.html), [Delphi](https://www.regular-expressions.info/delphi.html), and [R](https://www.regular-expressions.info/rlanguage.html).

[JavaScript](https://www.regular-expressions.info/javascript.html) and [Ruby](https://www.regular-expressions.info/ruby.html) do not support nested references, but treat them as backreferences to non-participating groups instead of as errors. In JavaScript that means they always match a zero-length string, while in Ruby they always fail to match. In [std::regex](https://www.regular-expressions.info/stdregex.html), [Boost](https://www.regular-expressions.info/boost.html), [Python](https://www.regular-expressions.info/python.html), and [Tcl](https://www.regular-expressions.info/tcl.html), nested references are an error.

# Relative Backreferences

![](https://www.regular-expressions.info/img/bulb.png)

Some applications support relative backreferences. These use a negative number to reference a group preceding the backreference. To find the group that the relative backreference refers to, take the absolute number of the backreference and count that many opening parentheses of (named or unnamed) capturing groups starting at the backreference and going from right to left through the regex. So (a)(b)(c)\k<-1> matches abcc and (a)(b)(c)\k<-3> matches abca. If the backreference is inside a capturing group, then you also need to count that capturing group’s opening parenthesis. So (a)(b)(c\k<-2>) matches abcb. (a)(b)(c\k<-1>) either fails to match or is an error depending on whether your application allows [nested backreferences](https://www.regular-expressions.info/backref2.html).

The syntax for nested backreferences varies widely. It is generally an extension of the syntax for [named backreferences](https://www.regular-expressions.info/named.html). [JGsoft V2](https://www.regular-expressions.info/jgsoft.html#v2) and [Ruby](https://www.regular-expressions.info/ruby.html) 1.9 and later support \k<-1> and \k'-1'. Though this looks like the .NET syntax for named capture, .NET itself does not support relative backreferences.

[Perl](https://www.regular-expressions.info/perl.html) 5.10, [PCRE](https://www.regular-expressions.info/pcre.html) 7.0, [PHP](https://www.regular-expressions.info/php.html) 5.2.2, and [R](https://www.regular-expressions.info/rlanguage.html) support \g{-1} and \g-1.

[Boost](https://www.regular-expressions.info/boost.html) supports the Perl syntax starting with Boost 1.42. Boost adds the Ruby syntax starting with Boost 1.47. To complicate matters, Boost 1.47 allowed these variants to multiply. Boost 1.47 and later allow relative backreferences to be specified with \g or \k and with curly braces, angle brackets, or quotes. That makes six variations plus \g-1 for a total of seven variations. This puts Boost in conflict with Ruby, PCRE, PHP, R, and JGsoft which treat \g with angle brackets or quotes and a negative number as a [relative subroutine call](https://www.regular-expressions.info/subroutine.html).
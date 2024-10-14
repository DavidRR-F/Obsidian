# Regular Expression Recursion

![](https://www.regular-expressions.info/img/bulb.png)

[Perl 5.10](https://www.regular-expressions.info/perl.html), [PCRE 4.0](https://www.regular-expressions.info/pcre.html), [Ruby 2.0](https://www.regular-expressions.info/ruby.html), and all later versions of these three, support regular expression recursion. Perl uses the syntax (?R) with (?0) as a synonym. Ruby 2.0 uses \g<0>. PCRE supports all three as of version 7.7. Earlier versions supported only the Perl syntax (which Perl actually copied from PCRE). Recent versions of [Delphi](https://www.regular-expressions.info/delphi.html), [PHP](https://www.regular-expressions.info/php.html), and [R](https://www.regular-expressions.info/rlanguage.html) also support all three, as their regex functions are based on PCRE. [JGsoft V2](https://www.regular-expressions.info/jgsoft.html#v2) also supports all variations of regex recursion.

While Ruby 1.9 does not have any syntax for regex recursion, it does support [capturing group recursion](https://www.regular-expressions.info/subroutine.html). So you could recurse the whole regex in Ruby 1.9 if you wrap the whole regex in a capturing group. [.NET](https://www.regular-expressions.info/dotnet.html) does not support recursion, but it supports [balancing groups](https://www.regular-expressions.info/balancing.html) that can be used instead of recursion to match balanced constructs.

As we’ll see later, there are differences in how Perl, PCRE, and Ruby deal with [backreferences](https://www.regular-expressions.info/recursebackref.html) and [backtracking](https://www.regular-expressions.info/recursebacktrack.html) during recursion. While they copied each other’s syntax, they did not copy each other’s behavior. JGsoft V2, however, copied their syntax and their behavior. So JGsoft V2 has three different ways of doing regex recursion, which you choose by using a different syntax. But these differences do not come into play in the basic example on this page.

[Boost](https://www.regular-expressions.info/boost.html) 1.42 copied the syntax from Perl. But its implementation is marred by bugs. Boost 1.60 attempted to fix the behavior of [quantifiers on recursion](https://www.regular-expressions.info/recurserepeat.html), but it’s still quite different from other flavors and incompatible with previous versions of Boost. Boost 1.64 finally stopped crashing upon [infinite recursion](https://www.regular-expressions.info/recurseinfinite.html). But recursion of the whole regex still attempts only the first alternative.

## Simple Recursion

The regexes a(?R)?z, a(?0)?z, and a\g<0>?z all match one or more letters a followed by exactly the same number of letters z. Since these regexes are functionally identical, we’ll use the syntax with R for recursion to see how this regex matches the string aaazzz.

First, a matches the first a in the string. Then the regex engine reaches (?R). This tells the engine to attempt the whole regex again at the present position in the string. Now, a matches the second a in the string. The engine reaches (?R) again. On the second recursion, a matches the third a. On the third recursion, a fails to match the first z in the string. This causes (?R) to fail. But the regex uses a quantifier to make (?R) [optional](https://www.regular-expressions.info/optional.html). So the engine continues with z which matches the first z in the string.

Now, the regex engine has reached the end of the regex. But since it’s two levels deep in recursion, it hasn’t found an overall match yet. It only has found a match for (?R). Exiting the recursion after a successful match, the engine also reaches z. It now matches the second z in the string. The engine is still one level deep in recursion, from which it exits with a successful match. Finally, z matches the third z in the string. The engine is again at the end of the regex. This time, it’s not inside any recursion. Thus, it returns aaazzz as the overall regex match.

## Matching Balanced Constructs

The main purpose of recursion is to match balanced constructs or nested constructs. The generic regex is b(?:m|(?R))*e where b is what begins the construct, m is what can occur in the middle of the construct, and e is what can occur at the end of the construct. For correct results, no two of b, m, and e should be able to match the same text. You can use an [atomic group](https://www.regular-expressions.info/atomic.html) instead of the [non-capturing group](https://www.regular-expressions.info/brackets.html) for improved performance: b(?>m|(?R))*e.

A common real-world use is to match a balanced set of parentheses. \((?>[^()]|(?R))*\) matches a single pair of parentheses with any text in between, including an unlimited number of parentheses, as long as they are all properly paired. If the subject string contains unbalanced parentheses, then the first regex match is the leftmost pair of balanced parentheses, which may occur after unbalanced opening parentheses. If you want a regex that does not find any matches in a string that contains unbalanced parentheses, then you need to use a [subroutine call](https://www.regular-expressions.info/subroutine.html) instead of recursion. If you want to find a sequence of multiple pairs of balanced parentheses as a single match, then you also need a subroutine call.

## Recursion with Alternation

If what may appear in the middle of the balanced construct may also appear on its own without the beginning and ending parts then the generic regex is b(?R)*e|m. Again, b, m, and e all need to be mutually exclusive. \((?R)*\)|[^()]+ matches a pair of balanced parentheses like the regex in the previous section. But it also matches any text that does not contain any parentheses at all.

This regular expression does not work correctly in Boost. If a regex has [alternation](https://www.regular-expressions.info/alternation.html) that is not inside a group then recursion of the whole regex in Boost only attempts the first alternative. So \((?R)*\)|[^()]+ in Boost matches any number of balanced parentheses nested arbitrarily deep with no text in between, or any text that does not contain any parentheses at all. If you flip the alternatives then [^()]+|\((?R)*\) in Boost matches any text without any parentheses or a single pair of parentheses with any text without parentheses in between. In all other flavors these two regexes find the same matches.

The solution for Boost is to put the alternation inside a group. (?:\((?R)*\)|[^()]+) and (?:[^()]+|\((?R)*\)) find the same matches in all flavors discussed in this tutorial that support recursion.

# Infinite Recursion

![](https://www.regular-expressions.info/img/bulb.png)

Regular expressions such as (?R)?z or a?(?R)?z or a|(?R)z that use recursion without having anything that must be matched in front of the recursion can result in infinite recursion. If the regex engine reaches the recursion without having advanced through the text then the next recursion will again reach the recursion without having advanced through the text. With the first regex this happens immediately at the start of the match attempt. With the other two this happens as soon as there are no further letters a to be matched.

JGsoft V2 and Boost 1.64 treat the first two regexes as a syntax error because they always lead to infinite recursion. They allow the third regex because that one can match a. Ruby 1.9 and later, all versions of PCRE, and PCRE2 10.20 and prior treat all three forms of potential infinite recursion as a syntax error. Perl, PCRE2 10.21 and later, and Boost 1.63 and prior allow all three forms.

## Circular Infinite Subroutine Calls

Subroutine calls can also lead to infinite recursion. All flavors handle the potentially infinite recursion in ((?1)?z) or (a?(?1)?z) or (a|(?1)z) in the same way as they handle potentially infinite recursion of the entire regex.

But subroutine calls that are not recursive by themselves may end up being recursive if the group they call has another subroutine call that calls a parent group of the first subroutine call. When subroutine calls are forced to go around in a circle that too leads to infinite recursion. Detecting such circular calls when compiling a regex is more complicated than checking for straight infinite recursion. Only JGsoft V2 and Ruby 1.9 and later are able to detect this and treat it as a syntax error. All other flavors allow these regexes.

## Errors and Crashes

When infinite recursion does occur, whether it’s straight recursion or subroutine calls going in circles, JGsoft V2, Perl, and PCRE2 treat it as a matching error that aborts the entire match attempt. Boost 1.64 handles this by not attempting the recursion and acting as if the recursion failed. If the recursion is optional then Boost 1.64 may find matches where other flavors throw errors.

Boost 1.63 and prior and PCRE 8.12 and prior crash when infinite recursion occurs. This also affects Delphi up to version XE6 and PHP up to version 5.4.8 as they are based on older PCRE versions.

## Endless Recursion

A regex such as a(?R)z that has a recursion token that is not optional and is not have [an alternative](https://www.regular-expressions.info/alternation.html) without the same recursion leads to endless recursion. Such a regular expression can never find a match. When a matches the regex engine attempts the recursion. If it can match another a then it has to attempt the recursion again. Eventually a will run out of letters to match. The recursion then fails. Because it’s not optional the regex fails to match.

JGsoft V2 and Ruby detect this situation when compiling your regular expression. They flag endless recursion as a syntax error. Perl, PCRE, PCRE2, and Boost do not detect endless recursion. They simply go through the matching process which finds no matches.

# Quantifiers On Recursion

![](https://www.regular-expressions.info/img/bulb.png)

The [introduction to recursion](https://www.regular-expressions.info/recurse.html) shows how a(?R)?z matches aaazzz. The [quantifier](https://www.regular-expressions.info/repeat.html) ? makes the preceding token optional. In other words, it repeats the token between zero or one times. In a(?R)?z the (?R) is made optional by the ? that follows it. You may wonder why the regex attempted the recursion three times, instead of once or not at all.

The reason is that upon recursion, the regex engine takes a fresh start in attempting the whole regex. All quantifiers and alternatives behave as if the matching process prior to the recursion had never happened at all, other than that the engine advanced through the string. The regex engine restores the states of all quantifiers and alternatives when it exits from a recursion, whether the recursion matched or failed. Basically, the matching process continues normally as if the recursion never happened, other than that the engine advanced through the string.

If you’re familiar with procedural programming languages, regex recursion is basically a recursive function call and the quantifiers are local variables in the function. Each recursion of the function gets its own set of local variables that don’t affect and aren’t affected by the same local variables in recursions higher up the stack. Quantifiers on recursion work this way in all flavors, except [Boost](https://www.regular-expressions.info/boost.html).

Let’s see how a(?R){3}z|q behaves (Boost excepted). The simplest possible match is q, found by the second alternative in the regex.

The simplest match in which the first alternative matches is aqqqz. After a is matches, the regex engine begins a recursion. a fails to match q. Still inside the recursion, the engine attempts the second alternative. q matches q. The engine exits from the recursion with a successful match. The engine now notes that the quantifier {3} has successfully repeated once. It needs two more repetitions, so the engine begins another recursion. It again matches q. On the third iteration of the quantifier, the third recursion matches q. Finally, z matches z and an overall match is found.

This regex does not match aqqz or aqqqqz. aqqz fails because during the third iteration of the quantifier, the recursion fails to match z. aqqqqz fails because after a(?R){3} has matched aqqq, z fails to match the fourth q.

The regex can match longer strings such as aqaqqqzqz. With this string, during the second iteration of the quantifier, the recursion matches aqqqz. Since each recursion tracks the quantifier separately, the recursion needs three consecutive recursions of its own to satisfy its own instance of the quantifier. This can lead to arbitrarily long matches such as aaaqqaqqqzzaqqqzqzqaqqaaqqqzqqzzz.

## How Boost Handles Quantifiers on Recursion

Boost has its own ideas about how quantifiers should work on recursion. Recursion only works the same in Boost as in other flavors if the recursion operator either has no quantifier at all or if it has * as its quantifier. Any other quantifier may lead to very different matches (or lack thereof) in Boost 1.59 or prior versus Boost 1.60 and later versus other regex flavors. Boost 1.60 attempted to fix some of the differences between Boost and other flavors but it only resulted in a different incompatible behavior.

In Boost 1.59 and prior, quantifiers on recursion count both iteration and recursion throughout the entire recursion stack. So possible matches for a(?R){3}z|q in Boost 1.59 include aaaazzzz, aaaqzzz, aaqqzz, aaqzqz, and aqaqzzz. In all these matches the number of recursions and iterations add up to 3. No other flavor would find these matches because they require 3 iterations during each recursion. So other flavors can match things like aaqqqzaqqqzaqqqzz or aqqaqqqzz. Boost 1.59 would match only aqqqz within these strings.

Boost 1.60 attempts to iterate quantifiers at each recursion level like other flavors, but does so incorrectly. Any quantifier that makes the recursion optional allows for infinite repetition. So Boost 1.60 and later treat a(?R)?z the same as a(?R)*z. While this fixes the problem that a(?R)?z could not match aaazzz entirely in Boost 1.59, it also allows matches such as aazazz that other flavors won’t find with this regex. If the quantifier is not optional, then Boost 1.60 only allows it to match during the first recursion. So a(?R){3}z|q could only ever match q or aqqqz.

Boost’s issues with quantifiers on recursion also affect quantifiers on parent groups of the recursion token. They also affect quantifiers on subroutine calls and quantifiers on groups that contain a subroutine call to a parent group of the group with the quantifier.

## Quantifiers on Other Tokens in The Recursion

Quantifiers on other tokens in the regex behave normally during recursion. They track their iterations separately at each recursion. So a{2}(?R)z|q matches aaqz, aaaaqzz, aaaaaaqzzz, and so on. a has to match twice during each recursion.

Quantifiers like these that are inside the recursion but do not repeat the recursion itself do work correctly in Boost.

# Subroutine Calls May or May Not Capture

![](https://www.regular-expressions.info/img/bulb.png)

This tutorial [introduced regular expression subroutines](https://www.regular-expressions.info/subroutine.html) with this example that we want to match accurately:

Name: John Doe
Born: 17-Jan-1964
Admitted: 30-Jul-2013
Released: 3-Aug-2013

In [Ruby](https://www.regular-expressions.info/ruby.html) or [PCRE](https://www.regular-expressions.info/pcre.html), we can use this regular expression:

^Name:\ (.*)\n  
Born:\ (?'date'(?:3[01]|[12][0-9]|[1-9])               -(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)               -(?:19|20)[0-9][0-9])\n  
Admitted:\ \g'date'\n  
Released:\ \g'date'$

[Perl](https://www.regular-expressions.info/perl.html) needs slightly different syntax, which also works in PCRE:

^Name:\ (.*)\n  
Born:\ (?'date'(?:3[01]|[12][0-9]|[1-9])               -(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)               -(?:19|20)[0-9][0-9])\n  
Admitted:\ (?&date)\n  
Released:\ (?&date)$

Unfortunately, there are differences in how these three regex flavors treat subroutine calls beyond their syntax. First of all, in Ruby a subroutine call makes the capturing group store the text matched during the subroutine call. In Perl, PCRE, and Boost a subroutine call does not affect the group that is called.

When the Ruby solution matches the sample above, retrieving the contents of the capturing group “date” will get you 3-Aug-2013 which was matched by the last subroutine call to that group. When the Perl solution matches the same, retrieving $+{date} will get you 17-Jan-1964. In Perl, the subroutine calls did not capture anything at all. But the “Born” date was matched with a normal [named capturing group](https://www.regular-expressions.info/named.html) which stored the text that it matched normally. Any subroutine calls to the group don’t change that. PCRE behaves as Perl in this case, even when you use the Ruby syntax with PCRE.

[JGsoft V2](https://www.regular-expressions.info/jgsoft.html#v2) behaves like Ruby when you use the first regular expression. You can remember this by the fact that the \g syntax is a Ruby invention, later copied by PCRE. JGsoft V2 behaves like Perl when you use the second regular expression. You can remember this by the fact that Perl uses ampersands for subroutine calls in procedural code too.

If you want to extract the dates from the match, the best solution is to add another capturing group for each date. Then you can ignore the text stored by the “date” group and this particular difference between these flavors. In Ruby or PCRE:

^Name:\ (.*)\n  
Born:\ (?'born'(?'date'(?:3[01]|[12][0-9]|[1-9])                       -(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)                       -(?:19|20)[0-9][0-9]))\n  
Admitted:\ (?'admitted'\g'date')\n  
Released:\ (?'released'\g'date')$

[Perl](https://www.regular-expressions.info/perl.html) needs slightly different syntax, which also works in PCRE:

^Name:\ (.*)\n  
Born:\ (?'born'(?'date'(?:3[01]|[12][0-9]|[1-9])                       -(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)                       -(?:19|20)[0-9][0-9]))\n  
Admitted:\ (?'admitted'(?&date))\n  
Released:\ (?'released'(?&date))$

## Capturing Groups Inside Recursion or Subroutine Calls

There are further differences between Perl, PCRE, and Ruby when your regex makes a subroutine call or recursive call to a capturing group that contains other capturing groups. The same issues also affect [recursion of the whole regular expression](https://www.regular-expressions.info/recurse.html) if it contains any capturing groups. For the remainder of this topic, the term “recursion” applies equally to recursion of the whole regex, recursion into a capturing group, or a subroutine call to a capturing group.

PCRE and Boost back up and restores capturing groups when entering and exiting recursion. When the regex engine enters recursion, it internally makes a copy of all capturing groups. This does not affect the capturing groups. Backreferences inside the recursion match text captured prior to the recursion unless and until the group they reference captures something during the recursion. After the recursion, all capturing groups are replaced with the internal copy that was made at the start of the recursion. Text captured during the recursion is discarded. This means you cannot use capturing groups to retrieve parts of the text that were matched during recursion.

Perl 5.10, the first version to have recursion, through version 5.18, isolated capturing groups between each level of recursion. When Perl 5.10’s regex engine enters recursion, all capturing groups appear as they have not participated in the match yet. Initially, all backreferences will fail. During the recursion, capturing groups capture as normal. Backreferences match text captured during the same recursion as normal. When the regex engine exits from the recursion, all capturing groups revert to the state they were in prior to the recursion. Perl 5.20 changed Perl’s behavior to back up and restore capturing groups the way PCRE does.

For most practical purposes, however, you’ll only use backreferences after their corresponding capturing groups. Then the difference between the way Perl 5.10 through 5.18 deal with capturing groups during recursion and the way PCRE and later versions of Perl do is academic.

Ruby’s behavior is completely different. When Ruby’s regex engine enters or exits recursion, it makes no changes to the text stored by capturing groups at all. Backreferences match the text stored by the capturing group during the group’s most recent match, irrespective of any recursion that may have happened. After an overall match is found, each capturing group still stores the text of its most recent match, even if that was during a recursion. This means you can use capturing groups to retrieve part of the text matched during the last recursion.

JGsoft V2 behaves like Ruby when you use the \g syntax borrowed from Ruby. It behaves like Perl 5.20 and PCRE when you use any other syntax.

## Odd Length Palindromes in Perl and PCRE

In Perl and PCRE you can use \b(?'word'(?'letter'[a-z])(?&word)\k'letter'|[a-z])\b to match palindrome words such as a, dad, radar, racecar, and redivider. This regex only matches palindrome words that are an odd number of letters long. This covers most palindrome words in English. To extend the regex to also handle palindrome words that are an even number of characters long we have to worry about differences in how Perl and PCRE [backtrack after a failed recursion attempt](https://www.regular-expressions.info/recursebacktrack.html) which is discussed later in this tutorial. We gloss over these differences here because they only come into play when the subject string is not a palindrome and no match can be found.

Let’s see how this regex matches radar. The [word boundary](https://www.regular-expressions.info/wordboundaries.html) \b matches at the start of the string. The regex engine enters the two capturing groups. [a-z] matches r which is then stored in the capturing group “letter”. Now the regex engine enters the first recursion of the group “word”. At this point, Perl forgets that the “letter” group matched r. PCRE does not. But this does not matter. (?'letter'[a-z]) matches and captures a. The regex enters the second recursion of the group “word”. (?'letter'[a-z]) captures d. During the next two recursions, the group captures a and r. The fifth recursion fails because there are no characters left in the string for [a-z] to match. The regex engine must backtrack.

Because (?&word) failed to match, (?'letter'[a-z]) must give up its match. The group reverts to a, which was the text the group held at the start of the recursion. (It becomes empty in Perl 5.18 and prior.) Again, this does not matter because the regex engine must now try the second alternative inside the group “word”, which contains no backreferences. The second [a-z] matches the final r in the string. The engine now exits from a successful recursion. The text stored by the group “letter” is restored to what it had captured prior to entering the fourth recursion, which is a.

After matching (?&word) the engine reaches \k'letter'. The backreference fails because the regex engine has already reached the end of the subject string. So it backtracks once more, making the capturing group give up the a. The second alternative now matches the a. The regex engine exits from the third recursion. The group “letter” is restored to the d matched during the second recursion.

The regex engine has again matched (?&word). The backreference fails again because the group stores d while the next character in the string is r. Backtracking again, the second alternative matches d and the group is restored to the a matched during the first recursion.

Now, \k'letter' matches the second a in the string. That’s because the regex engine has arrived back at the first recursion during which the capturing group matched the first a. The regex engine exits the first recursion. The capturing group is restored to the r which it matched prior to the first recursion.

Finally, the backreference matches the second r. Since the engine is not inside any recursion any more, it proceeds with the remainder of the regex after the group. \b matches at the end of the string. The end of the regex is reached and radar is returned as the overall match. If you query the groups “word” and “letter” after the match you’ll get radar and r. That’s the text matched by these groups outside of all recursion.

## Why This Regex Does Not Work in Ruby

To match palindromes this way in Ruby, you need to use a special [backreference that specifies a recursion level](https://www.regular-expressions.info/recursebackref.html). If you use a normal backreference as in \b(?'word'(?'letter'[a-z])\g'word'\k'letter'|[a-z])\b, Ruby will not complain. But it will not match palindromes longer than three letters either. Instead this regex matches things like a, dad, radaa, raceccc, and rediviiii.

Let’s see why this regex does not match radar in Ruby. Ruby starts out like Perl and PCRE, entering the recursions until there are no characters left in the string for [a-z] to match.

Because \g'word' failed to match, (?'letter'[a-z]) must give up its match. Ruby reverts it to a, which was the text the group most recently matched. The second [a-z] matches the final r in the string. The engine now exits from a successful recursion. The group “letter” continues to hold its most recent match a.

After matching \g'word' the engine reaches \k'letter'. The backreference fails because the regex engine has already reached the end of the subject string. So it backtracks once more, reverting the group to the previously matched d. The second alternative now matches the a. The regex engine exits from the third recursion.

The regex engine has again matched \g'word'. The backreference fails again because the group stores d while the next character in the string is r. Backtracking again, the group reverts to a and the second alternative matches d.

Now, \k'letter' matches the second a in the string. The regex engine exits the first recursion which successfully matched ada. The capturing group continues to hold a which is its most recent match that wasn’t backtracked.

The regex engine is now at the last character in the string. This character is r. The backreference fails because the group still holds a. The engine can backtrack once more, forcing (?'letter'[a-z])\g'word'\k'letter' to give up the rada it matched so far. The regex engine is now back at the start of the string. It can still try the second alternative in the group. This matches the first r in the string. Since the engine is not inside any recursion any more, it proceeds with the remainder of the regex after the group. \b fails to match after the first r. The regex engine has no further permutations to try. The match attempt has failed.

If the subject string is radaa, Ruby’s engine goes through nearly the same matching process as described above. Only the events described in the last paragraph change. When the regex engine reaches the last character in the string, that character is now a. This time, the backreference matches. Since the engine is not inside any recursion any more, it proceeds with the remainder of the regex after the group. \b matches at the end of the string. The end of the regex is reached and radaa is returned as the overall match. If you query the groups “word” and “letter” after the match you’ll get radaa and a. Those are the most recent matches of these groups that weren’t backtracked.

Basically, in Ruby this regex matches any word that is an odd number of letters long and in which all the characters to the right of the middle letter are identical to the character just to the left of the middle letter. That’s because Ruby only restores capturing groups when they backtrack, but not when it exits from recursion.

The solution, specific to Ruby, is to use a [backreference that specifies a recursion level](https://www.regular-expressions.info/recursebackref.html) instead of the normal backreference used in the regex on this page.

# Backreferences That Specify a Recursion Level

![](https://www.regular-expressions.info/img/bulb.png)

Earlier topics in this tutorial explain [regular expression recursion](https://www.regular-expressions.info/recurse.html) and [regular expression subroutines](https://www.regular-expressions.info/subroutine.html). In this topic the word “recursion” refers to recursion of the whole regex, recursion of capturing groups, and subroutine calls to capturing groups. The previous topic also explained that these features [handle capturing groups differently](https://www.regular-expressions.info/recursecapture.html) in Ruby than they do in Perl and PCRE.

Perl, PCRE, and Boost restore capturing groups when they exit from recursion. This means that backreferences in Perl, PCRE, and Boost match the same text that was matched by the capturing group at the same recursion level. This makes it possible to do things like [matching palindromes](https://www.regular-expressions.info/recursecapture.html#palindrome).

Ruby does not restore capturing groups when it exits from recursion. [Normal backreferences](https://www.regular-expressions.info/backref.html) match the text that is the same as the most recent match of the capturing group that was not backtracked, regardless of whether the capturing group found its match at the same or a different recursion level as the backreference. Basically, normal backreferences in Ruby don’t pay any attention to recursion.

But while the normal capturing group storage in Ruby does not get any special treatment for recursion, Ruby actually stores a full stack of matches for each capturing groups at all recursion levels. This stack even includes recursion levels that the regex engine has already exited from.

Backreferences in Ruby can match the same text as was matched by a capturing group at any recursion level relative to the recursion level that the backreference is evaluated at. You can do this with the same syntax for [named backreferences](https://www.regular-expressions.info/named.html) by adding a sign and a number after the name. In most situations you will use +0 to specify that you want the backreference to reuse the text from the capturing group at the same recursion level. You can specify a positive number to reference the capturing group at a deeper level of recursion. This would be a recursion the regex engine has already exited from. You can specify a negative number to reference the capturing group a level that is less deep. This would be a recursion that is still in progress.

[JGsoft V2](https://www.regular-expressions.info/jgsoft.html#v2) also supports backreferences that specify a recursion level using the same syntax as Ruby. To get the same behavior with JGsoft V2 as with Ruby, you have to use Ruby’s \g syntax for your subroutine calls.

## Odd Length Palindromes in Ruby

In Ruby you can use \b(?'word'(?'letter'[a-z])\g'word'\k'letter+0'|[a-z])\b to match palindrome words such as a, dad, radar, racecar, and redivider. To keep this example simple, this regex only matches palindrome words that are an odd number of letters long.

Let’s see how this regex matches radar. The [word boundary](https://www.regular-expressions.info/wordboundaries.html) \b matches at the start of the string. The regex engine enters the capturing group “word”. [a-z] matches r which is then stored in the stack for the capturing group “letter” at recursion level zero. Now the regex engine enters the first recursion of the group “word”. (?'letter'[a-z]) matches and captures a at recursion level one. The regex enters the second recursion of the group “word”. (?'letter'[a-z]) captures d at recursion level two. During the next two recursions, the group captures a and r at levels three and four. The fifth recursion fails because there are no characters left in the string for [a-z] to match. The regex engine must backtrack.

The regex engine must now try the second alternative inside the group “word”. The second [a-z] in the regex matches the final r in the string. The engine now exits from a successful recursion, going one level back up to the third recursion.

After matching \g'word' the engine reaches \k'letter+0'. The backreference fails because the regex engine has already reached the end of the subject string. So it backtracks once more. The second alternative now matches the a. The regex engine exits from the third recursion.

The regex engine has again matched \g'word' and needs to attempt the backreference again. The backreference specifies +0 or the present level of recursion, which is 2. At this level, the capturing group matched d. The backreference fails because the next character in the string is r. Backtracking again, the second alternative matches d.

Now, \k'letter+0' matches the second a in the string. That’s because the regex engine has arrived back at the first recursion during which the capturing group matched the first a. The regex engine exits the first recursion.

The regex engine is now back outside all recursion. At this level, the capturing group stored r. The backreference can now match the final r in the string. Since the engine is not inside any recursion any more, it proceeds with the remainder of the regex after the group. \b matches at the end of the string. The end of the regex is reached and radar is returned as the overall match.

## Backreferences to Other Recursion Levels

Backreferences to other recursion levels can be easily understood if we modify our palindrome example. abcdefedcba is also a palindrome matched by the previous regular expression. Consider the regular expression \b(?'word'(?'letter'[a-z])\g'word'(?:\k'letter-1'|z)|[a-z])\b. The backreference now wants a match the text one level less deep on the capturing group’s stack. It is alternated with the letter z so that something can be matched when the backreference fails to match.

The new regex matches things like abcdefdcbaz. After a whole bunch of matching and backtracking, the second [a-z] matches f. The regex engine exits from a successful fifth recursion. The capturing group “letter” has stored the matches a, b, c, d, and e at recursion levels zero to four. Other matches by that group were backtracked and thus not retained.

Now the engine evaluates the backreference \k'letter-1'. The present level is 4 and the backreference specifies -1. Thus the engine attempts to match d, which succeeds. The engine exits from the fourth recursion.

The backreference continues to match c, b, and a until the regex engine has exited the first recursion. Now, outside all recursion, the regex engine again reaches \k'letter-1'. The present level is 0 and the backreference specifies -1. Since recursion level -1 never happened, the backreference fails to match. This is not an error but simply a [backreference to a non-participating capturing group](https://www.regular-expressions.info/backref2.html). But the backreference has an alternative. z matches z and \b matches at the end of the string. abcdefdcbaz was matched successfully.

You can take this as far as you like. The regular expression \b(?'word'(?'letter'[a-z])\g'word'(?:\k'letter-2'|z)|[a-z])\b matches abcdefcbazz. \b(?'word'(?'letter'[a-z])\g'word'(?:\k'letter-99'|z)|[a-z])\b matches abcdefzzzzzz.

Going in the opposite direction, \b(?'word'(?'letter'[a-z])\g'word'(?:\k'letter+1'|z)|[a-z])\b matches abcdefzedcb. Again, after a whole bunch of matching and backtracking, the second [a-z] matches f, the regex engine is back at recursion level 4, and the group “letter” has a, b, c, d, and e at recursion levels zero to four on its stack.

Now the engine evaluates the backreference \k'letter+1'. The present level is 4 and the backreference specifies +1. The capturing group was backtracked at recursion level 5. This means we have a backreference to a non-participating group, which fails to match. The alternative z does match. The engine exits from the fourth recursion.

At recursion level 3, the backreference points to recursion level 4. Since the capturing group successfully matched at recursion level 4, it still has that match on its stack, even though the regex engine has already exited from that recursion. Thus \k'letter+1' matches e. Recursion level 3 is exited successfully.

The backreference continues to match d and c until the regex engine has exited the first recursion. Now, outside all recursion, the regex engine again reaches \k'letter+1'. The present level is 0 and the backreference specifies +1. The capturing group still retains all its previous successful recursion levels. So the backreference can still match the b that the group captured during the first recursion. Now \b matches at the end of the string. abcdefzdcb was matched successfully.

You can take this as far as you like in this direction too. The regular expression \b(?'word'(?'letter'[a-z])\g'word'(?:\k'letter+2'|z)|[a-z])\b matches abcdefzzedc. \b(?'word'(?'letter'[a-z])\g'word'(?:\k'letter+99'|z)|[a-z])\b matches abcdefzzzzzz.

# Recursion and Subroutine Calls May or May Not Be Atomic

![](https://www.regular-expressions.info/img/bulb.png)

Earlier topics in this tutorial explain [regular expression recursion](https://www.regular-expressions.info/recurse.html) and [regular expression subroutines](https://www.regular-expressions.info/subroutine.html). In this topic the word “recursion” refers to recursion of the whole regex, recursion of capturing groups, and subroutine calls to capturing groups.

[Perl](https://www.regular-expressions.info/perl.html) and [Ruby](https://www.regular-expressions.info/ruby.html) backtrack into recursion if the remainder of the regex after the recursion fails. They try all permutations of the recursion as needed to allow the remainder of the regex to match. [PCRE](https://www.regular-expressions.info/pcre.html) treats recursion as [atomic](https://www.regular-expressions.info/atomic.html). PCRE backtracks normally during the recursion, but once the recursion has matched, it does not try any further permutations of the recursion, even when the remainder of the regex fails to match. The result is that Perl and Ruby may find regex matches that PCRE cannot find, or that Perl and Ruby may find different regex matches.

Consider the regular expression aa$|a(?R)a|a in Perl or the equivalent aa$|a\g'0'a|a in Ruby 2.0. PCRE supports either syntax. Let’s see how Perl, Ruby, and PCRE go through the matching process of this regex when aaa is the subject string.

The first alternative aa$ fails because the [anchor](https://www.regular-expressions.info/anchors.html) cannot be matched between the second and third a in the string. Attempting the second alternative at the start of the string, a matches a. Now the regex engine enters the first recursion.

Inside the recursion, the first alternative matches the second and third a in the string. The regex engine exits a successful recursion. But now, the a that follows (?R) or \g'0' in the regex fails to match because the regex engine has already reached the end of the string. Thus the regex engine must backtrack. Here is where PCRE behaves differently than Perl or Ruby.

Perl and Ruby remember that inside the recursion the regex matched the second alternative and that there are three possible alternatives. Perl and Ruby backtrack _into_ the recursion. The second alternative inside the recursion is backtracked, reducing the match so far to the first a in the string. Now the third alternative is attempted. a matches the second a in the string. The regex engine again exits successfully from the same recursion. This time, the a that follows (?R) or \g'0' in the regex matches the third a in the string. aaa is found as the overall match.

PCRE, on the other hand, remembers nothing about the recursion other than that it matched aa at the end of the string. PCRE does backtrack _over_ the recursion, reducing the match so far to the first a in the string. But this leaves the second alternative in the regex without any further permutations to try. Thus the a at the start of the second alternative is also backtracked, reducing the match so far to nothing. PCRE continues the match attempt at the start of the string with the third alternative and finds that a matches a at the start of the string. In PCRE, this is the overall match.

You can make recursion in Perl and Ruby atomic by adding an atomic group. aa$|a(?>(?R))a|a in Perl and aa$|a(?>\g'0')a|a in Ruby is the same as the original regexes in PCRE.

[JGsoft V2](https://www.regular-expressions.info/jgsoft.html#v2) lets you choose whether recursion should be atomic or not. Atomic recursion gives better performance, but may exclude certain matches or find different matches as illustrated above. aa$|a(?P>0)a|a is atomic in JGsoft V2. You can remember this because this syntax for recursion uses an angle bracket just like an atomic group. You can use a number or a name instead of zero for an atomic subroutine call to a numbered or named capturing group. Any other syntax for recursion is not atomic in JGsoft V2.

[Boost](https://www.regular-expressions.info/boost.html) is of two minds. Recursion of the whole regex is atomic in Boost, like in PCRE. But Boost will backtrack into subroutine calls and into recursion of capturing groups, like Perl. So you can do non-atomic recursion in Boost by wrapping the whole regex into a capturing group and then calling that.

[PCRE2](https://www.regular-expressions.info/pcre2.html) originally behaved like PCRE, treating all recursion and subroutine calls as atomic. PCRE2 10.30 changed this, trying to be more like Perl, but ending up like Boost. PCRE2 10.30 will backtrack into subroutine calls and recursion of capturing groups like Perl does. But PCRE2 is still not able to backtrack into recursion of the whole regex. In the examples below, “PCRE” means the original PCRE only. For PCRE2 10.22 and prior, follow the PCRE example. For PCRE2 10.30 and later, follow the Perl example.

## Palindromes of Any Length in Perl and Ruby

The topic about [recursion and capturing groups](https://www.regular-expressions.info/recursecapture.html) explains a regular expression to match [palindromes](https://www.regular-expressions.info/recursecapture.html#palindrome) that are an odd number of characters long. The solution seems trivial. \b(?'word'(?'letter'[a-z])(?&word)\k'letter'|[a-z]?)\b does the trick in Perl. The quantifier ? makes the [a-z] that matches the letter in the middle of the palindrome optional. In Ruby we can use \b(?'word'(?'letter'[a-z])\g'word'\k'letter+0'|[a-z]?)\b which adds the same quantifier to the solution that specifies the [recursion level for the backreference](https://www.regular-expressions.info/recursebackref.html). In PCRE, the Perl solution still matches odd-length palindromes, but not even-length palindromes.

Let’s see how these regexes match or fail to match deed. PCRE starts off the same as Perl and Ruby, just as in the original regex. The group “letter” matches d. During three consecutive recursions, the group captures e, e, and d. The fourth recursion fails, because there are no characters left to match. Back in the third recursion, the first alternative is backtracked and the second alternative matches d at the end of the string. The engine exits the third recursion with a successful match. Back in the second recursion, the backreference fails because there are no characters left in the string.

Here the behavior diverges. Perl and Ruby backtrack _into_ the third recursion and backtrack the quantifier ? that makes the second alternative optional. In the third recursion, the second alternative gives up the d that it matched at the end of the string. The engine exits the third recursion again, this time with a successful zero-length match. Back in the second recursion, the backreference still fails because the group stored e for the second recursion but the next character in the string is d. Thus the first alternative is backtracked and the second alternative matches the second e in the string. The second recursion is exited with success.

In the first recursion, the backreference again fails. The group stored e for the first recursion but the next character in the string is d. Again, Perl and Ruby backtrack into the second recursion to try the permutation where the second alternative finds a zero-length match. Back in the first recursion again, the backreference now matches the second e in the string. The engine leaves the first recursion with success. Back in the overall match attempt, the backreference matches the final d in the string. The word boundary succeeds and an overall match is found.

PCRE, however, does not backtrack into the third recursion. It does backtrack _over_ the third recursion when it backtracks the first alternative in the second recursion. Now, the second alternative in the second recursion matches the second e in the string. The second recursion is exited with success.

In the first recursion, the backreference again fails. The group stored e for the first recursion but the next character in the string is d. Again, PCRE does not backtrack into the second recursion, but immediately fails the first alternative in the first recursion. The second alternative in the first recursion now matches the first e in the string. PCRE exits the first recursion with success. Back in the overall match attempt, the backreference fails, because the group captured d prior to the recursion, and the next character is the second e in the string. Backtracking again, the second alternative in the overall regex match now matches the first d in the string. Then the word boundary fails. PCRE did not find any matches.

## Palindromes of Any Length in PCRE

To match palindromes of any length in PCRE, we need a regex that matches words of an even number of characters and of an odd number of characters separately. Free-spacing mode makes this regex easier to read:

\b(?'word'  (?'oddword' (?'oddletter' [a-z])(?P>oddword)  \k'oddletter' |[a-z])  
| (?'evenword'(?'evenletter'[a-z])(?P>evenword)?\k'evenletter')  
)\b

Basically, this is two copies of the original regex combined with alternation. The first alternatives has the groups “word” and “letter” renamed to “oddword” and “oddletter”. The second alternative has the groups “word” and “letter” renamed to “evenword” and “evenletter”. The call (?P>evenword) is now made optional with a question mark instead of the alternative |[a-z]. A new group “word” combines the two groups “oddword” and “evenword” so that the word boundaries still apply to the whole regex.

The first alternative “oddword” in this regex matches a palindrome of odd length like radar in exactly the same way as the regex discussed in the topic about [recursion and capturing groups](https://www.regular-expressions.info/recursecapture.html) does. The second alternative in the new regex is never attempted.

When the string is a palindrome of even length like deed, the new regex first tries all permutations of the first alternative. The second alternative “evenword” is attempted only after the first alternative fails to find a match.

The second alternative starts off in the same way as the original regex. The group “evenletter” matches d. During three consecutive recursions, the group captures e, e, and d. The fourth recursion fails, because there are no characters left to match. Back in the third recursion, the regex engine notes that recursive call (?P>evenword)? is optional. It proceeds to the backreference \k'evenletter'. The backreference fails because there are no characters left in the string. Since the recursion has no further alternatives to try, it is backtracked. The group “evenletter” must give up its most recent match and PCRE exits from the failed third recursion.

In the second recursion, the backreference fails because the capturing group matched e during that recursion but the next character in the string is d. The group gives up another match and PCRE exits from the failed second recursion.

Back in the first recursion, the backreference succeeds. The group matched the first e in the string during that recursion and the backreference matches the second. PCRE exits from the successful first recursion.

Back in the overall match attempt, the backreference succeeds again. The group matched the d at the start of the string during the overall match attempt, and the backreference matches the final d. Exiting the groups “evenword” and “word”, the word boundary matches at the end of the string. deed is the overall match.
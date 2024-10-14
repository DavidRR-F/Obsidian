# Lookahead and Lookbehind Zero-Length Assertions

![](https://www.regular-expressions.info/img/bulb.png)

Lookahead and lookbehind, collectively called “lookaround”, are zero-length assertions just like the [start and end of line](https://www.regular-expressions.info/anchors.html), and [start and end of word](https://www.regular-expressions.info/wordboundaries.html) anchors explained earlier in this tutorial. The difference is that lookaround actually matches characters, but then gives up the match, returning only the result: match or no match. That is why they are called “assertions”. They do not consume characters in the string, but only assert whether a match is possible or not. Lookaround allows you to create regular expressions that are impossible to create without them, or that would get very longwinded without them.

## Positive and Negative Lookahead

Negative lookahead is indispensable if you want to match something not followed by something else. When explaining [character classes](https://www.regular-expressions.info/charclass.html), this tutorial explained why you cannot use a negated character class to match a q not followed by a u. Negative lookahead provides the solution: q(?!u). The negative lookahead construct is the pair of parentheses, with the opening parenthesis followed by a question mark and an exclamation point. Inside the lookahead, we have the trivial regex u.

Positive lookahead works just the same. q(?=u) matches a q that is followed by a u, without making the u part of the match. The positive lookahead construct is a pair of parentheses, with the opening parenthesis followed by a question mark and an equals sign.

You can use any regular expression inside the lookahead (but not lookbehind, as explained below). Any valid regular expression can be used inside the lookahead. If it contains [capturing groups](https://www.regular-expressions.info/brackets.html) then those groups will capture as normal and backreferences to them will work normally, even outside the lookahead. (The only exception is [Tcl](https://www.regular-expressions.info/tcl.html), which treats all groups inside lookahead as non-capturing.) The lookahead itself is not a capturing group. It is not included in the count towards numbering the backreferences. If you want to store the match of the regex inside a lookahead, you have to put capturing parentheses around the regex inside the lookahead, like this: (?=(regex)). The other way around will not work, because the lookahead will already have discarded the regex match by the time the capturing group is to store its match.

## Regex Engine Internals

First, let’s see how the engine applies q(?!u) to the string Iraq. The first token in the regex is the [literal](https://www.regular-expressions.info/characters.html) q. As we already know, this causes the engine to traverse the string until the q in the string is matched. The position in the string is now the void after the string. The next token is the lookahead. The engine takes note that it is inside a lookahead construct now, and begins matching the regex inside the lookahead. So the next token is u. This does not match the void after the string. The engine notes that the regex inside the lookahead failed. Because the lookahead is negative, this means that the lookahead has successfully matched at the current position. At this point, the entire regex has matched, and q is returned as the match.

Let’s try applying the same regex to quit. q matches q. The next token is the u inside the lookahead. The next character is the u. These match. The engine advances to the next character: i. However, it is done with the regex inside the lookahead. The engine notes success, and discards the regex match. This causes the engine to step back in the string to u.

Because the lookahead is negative, the successful match inside it causes the lookahead to fail. Since there are no other permutations of this regex, the engine has to start again at the beginning. Since q cannot match anywhere else, the engine reports failure.

Let’s take one more look inside, to make sure you understand the implications of the lookahead. Let’s apply q(?=u)i to quit. The lookahead is now positive and is followed by another token. Again, q matches q and u matches u. Again, the match from the lookahead must be discarded, so the engine steps back from i in the string to u. The lookahead was successful, so the engine continues with i. But i cannot match u. So this match attempt fails. All remaining attempts fail as well, because there are no more q’s in the string.

The regex q(?=u)i can never match anything. It tries to match u and i at the same position. If there is a u immediately after the q then the lookahead succeeds but then i fails to match u. If there is anything other than a u immediately after the q then the lookahead fails.

## Positive and Negative Lookbehind

Lookbehind has the same effect, but works backwards. It tells the regex engine to temporarily step backwards in the string, to check if the text inside the lookbehind can be matched there. (?<!a)b matches a “b” that is not preceded by an “a”, using negative lookbehind. It doesn’t match cab, but matches the b (and only the b) in bed or debt. (?<=a)b (positive lookbehind) matches the b (and only the b) in cab, but does not match bed or debt.

The construct for positive lookbehind is (?<=text): a pair of parentheses, with the opening parenthesis followed by a question mark, “less than” symbol, and an equals sign. Negative lookbehind is written as (?<!text), using an exclamation point instead of an equals sign.

## More Regex Engine Internals

Let’s apply (?<=a)b to thingamabob. The engine starts with the lookbehind and the first character in the string. In this case, the lookbehind tells the engine to step back one character, and see if a can be matched there. The engine cannot step back one character because there are no characters before the t. So the lookbehind fails, and the engine starts again at the next character, the h. (Note that a negative lookbehind would have succeeded here.) Again, the engine temporarily steps back one character to check if an “a” can be found there. It finds a t, so the positive lookbehind fails again.

The lookbehind continues to fail until the regex reaches the m in the string. The engine again steps back one character, and notices that the a can be matched there. The positive lookbehind matches. Because it is zero-length, the current position in the string remains at the m. The next token is b, which cannot match here. The next character is the second a in the string. The engine steps back, and finds out that the m does not match a.

The next character is the first b in the string. The engine steps back and finds out that a satisfies the lookbehind. b matches b, and the entire regex has been matched successfully. It matches one character: the first b in the string.

## Important Notes About Lookbehind

The good news is that you can use lookbehind anywhere in the regex, not only at the start. If you want to find a word not ending with an “s”, you could use \b\w+(?<!s)\b. This is definitely not the same as \b\w+[^s]\b. When applied to John's, the former matches John and the latter matches John' (including the apostrophe). I will leave it up to you to figure out why. (Hint: \b matches between the apostrophe and the s). The latter also doesn’t match single-letter words like “a” or “I”. The correct regex without using lookbehind is \b\w*[^s\W]\b (star instead of plus, and \W in the character class). Personally, I find the lookbehind easier to understand. The last regex, which works correctly, has a double negation (the \W in the negated character class). Double negations tend to be confusing to humans. Not to regex engines, though. (Except perhaps for Tcl, which treats negated shorthands in negated character classes as an error.)

The bad news is that most regex flavors do not allow you to use just any regex inside a lookbehind, because they cannot apply a regular expression backwards. The regular expression engine needs to be able to figure out how many characters to step back before checking the lookbehind. When evaluating the lookbehind, the regex engine determines the length of the regex inside the lookbehind, steps back that many characters in the subject string, and then applies the regex inside the lookbehind from left to right just as it would with a normal regex.

Many regex flavors, including those used by [Perl](https://www.regular-expressions.info/perl.html), [Python](https://www.regular-expressions.info/python.html), and [Boost](https://www.regular-expressions.info/boost.html) only allow fixed-length strings. You can use [literal text](https://www.regular-expressions.info/characters.html), [character escapes](https://www.regular-expressions.info/nonprint.html#hex), [Unicode escapes](https://www.regular-expressions.info/nonprint.html#hex) other than \X, and [character classes](https://www.regular-expressions.info/charclass.html). You cannot use [quantifiers](https://www.regular-expressions.info/repeat.html) or [backreferences](https://www.regular-expressions.info/backref.html). You can use [alternation](https://www.regular-expressions.info/alternation.html), but only if all alternatives have the same length. These flavors evaluate lookbehind by first stepping back through the subject string for as many characters as the lookbehind needs, and then attempting the regex inside the lookbehind from left to right.

Perl 5.30 supports variable-length lookbehind as an experimental feature. But there are many cases in which it does not work correctly. So in practice, the above is still true for Perl 5.30.

[PCRE](https://www.regular-expressions.info/pcre.html) is not fully Perl-compatible when it comes to lookbehind. While Perl requires alternatives inside lookbehind to have the same length, PCRE allows alternatives of variable length. [PHP](https://www.regular-expressions.info/php.html), [Delphi](https://www.regular-expressions.info/delphi.html), [R](https://www.regular-expressions.info/rlanguage.html), and [Ruby](https://www.regular-expressions.info/ruby.html) also allow this. Each alternative still has to be fixed-length. Each alternative is treated as a separate fixed-length lookbehind.

[Java](https://www.regular-expressions.info/java.html) takes things a step further by allowing finite repetition. You can use the [question mark](https://www.regular-expressions.info/optional.html) and the [curly braces](https://www.regular-expressions.info/repeat.html) with the _max_ parameter specified. Java determines the minimum and maximum possible lengths of the lookbehind. The lookbehind in the regex (?<!ab{2,4}c{3,5}d)test has 5 possible lengths. It can be from 7 through 11 characters long. When Java (version 6 or later) tries to match the lookbehind, it first steps back the minimum number of characters (7 in this example) in the string and then evaluates the regex inside the lookbehind as usual, from left to right. If it fails, Java steps back one more character and tries again. If the lookbehind continues to fail, Java continues to step back until the lookbehind either matches or it has stepped back the maximum number of characters (11 in this example). This repeated stepping back through the subject string kills performance when the number of possible lengths of the lookbehind grows. Keep this in mind. Don’t choose an arbitrarily large maximum number of repetitions to work around the lack of infinite quantifiers inside lookbehind. Java 4 and 5 have bugs that cause lookbehind with alternation or variable quantifiers to fail when it should succeed in some situations. These bugs were fixed in Java 6.

Java 13 allows you to use the [star](https://www.regular-expressions.info/repeat.html) and [plus](https://www.regular-expressions.info/repeat.html) inside lookbehind, as well as [curly braces](https://www.regular-expressions.info/repeat.html) without an upper limit. But Java 13 still uses the laborious method of matching lookbehind introduced with Java 6. Java 13 also does not correctly handle lookbehind with multiple quantifiers if one of them is unbounded. In some situations you may get an error. In other situations you may get incorrect matches. So for both correctness and performance, we recommend you only use quantifiers with a low upper bound in lookbehind with Java 6 through 13.

The only regex engines that allow you to use a full regular expression inside lookbehind, including infinite repetition and backreferences, are the [JGsoft engine](https://www.regular-expressions.info/jgsoft.html) and the [.NET RegEx classes](https://www.regular-expressions.info/dotnet.html). These regex engines really apply the regex inside the lookbehind backwards, going through the regex inside the lookbehind and through the subject string from right to left. They only need to evaluate the lookbehind once, regardless of how many different possible lengths it has.

Finally, flavors like [std::regex](https://www.regular-expressions.info/stdregex.html) and [Tcl](https://www.regular-expressions.info/tcl.html) do not support lookbehind at all, even though they do support lookahead. [JavaScript](https://www.regular-expressions.info/javascript.html) was like that for the longest time since its inception. But now lookbehind is part of the ECMAScript 2018 specification. As of this writing (late 2019), Google’s Chrome browser is the only popular JavaScript implementation that supports lookbehind. So if cross-browser compatibility matters, you can’t use lookbehind in JavaScript.

## Lookaround Is Atomic

The fact that lookaround is zero-length automatically makes it [atomic](https://www.regular-expressions.info/atomic.html#use). As soon as the lookaround condition is satisfied, the regex engine forgets about everything inside the lookaround. It will not backtrack inside the lookaround to try different permutations.

The only situation in which this makes any difference is when you use [capturing groups](https://www.regular-expressions.info/brackets.html) inside the lookaround. Since the regex engine does not backtrack into the lookaround, it will not try different permutations of the capturing groups.

For this reason, the regex (?=(\d+))\w+\1 never matches 123x12. First the lookaround captures 123 into \1. \w+ then matches the whole string and backtracks until it matches only 1. Finally, \w+ fails since \1 cannot be matched at any position. Now, the regex engine has nothing to backtrack to, and the overall regex fails. The backtracking steps created by \d+ have been discarded. It never gets to the point where the lookahead captures only 12.

Obviously, the regex engine does try further positions in the string. If we change the subject string, the regex (?=(\d+))\w+\1 does match 56x56 in 456x56.

If you don’t use capturing groups inside lookaround, then all this doesn’t matter. Either the lookaround condition can be satisfied or it cannot be. In how many ways it can be satisfied is irrelevant.

# Testing The Same Part of a String for More Than One Requirement

![](https://www.regular-expressions.info/img/bulb.png)

[Lookaround](https://www.regular-expressions.info/lookaround.html), which was introduced in detail in the [previous topic](https://www.regular-expressions.info/lookaround.html), is a very powerful concept. Unfortunately, it is often underused by people new to regular expressions, because lookaround is a bit confusing. The confusing part is that the lookaround is zero-length. So if you have a regex in which a lookahead is followed by another piece of regex, or a lookbehind is preceded by another piece of regex, then the regex traverses part of the string twice.

A more practical example makes this clear. Let’s say we want to find a word that is six letters long and contains the three consecutive letters cat. Actually, we can match this without lookaround. We just specify all the options and lump them together using [alternation](https://www.regular-expressions.info/alternation.html): cat\w{3}|\wcat\w{2}|\w{2}cat\w|\w{3}cat. Easy enough. But this method gets unwieldy if you want to find any word between 6 and 12 letters long containing either “cat”, “dog” or “mouse”.

## Lookaround to The Rescue

In this example, we basically have two requirements for a successful match. First, we want a word that is 6 letters long. Second, the word we found must contain the word “cat”.

Matching a 6-letter word is easy with \b\w{6}\b. Matching a word containing “cat” is equally easy: \b\w*cat\w*\b.

Combining the two, we get: (?=\b\w{6}\b)\b\w*cat\w*\b. Easy! Here’s how this works. At each character position in the string where the regex is attempted, the engine first attempts the regex inside the positive lookahead. This sub-regex, and therefore the lookahead, matches only when the current character position in the string is at the start of a 6-letter word in the string. If not, the lookahead fails and the engine continues trying the regex from the start at the next character position in the string.

The lookahead is zero-length. So when the regex inside the lookahead has found the 6-letter word, the current position in the string is still at the beginning of the 6-letter word. The regex engine attempts the remainder of the regex at this position. Because we already know that a 6-letter word can be matched at the current position, we know that \b matches and that the first \w* matches 6 times. The engine then [backtracks](https://www.regular-expressions.info/repeat.html), reducing the number of characters matched by \w*, until cat can be matched. If cat cannot be matched, the engine has no other choice but to restart at the beginning of the regex, at the next character position in the string. This is at the second letter in the 6-letter word we just found, where the lookahead will fail, causing the engine to advance character by character until the next 6-letter word.

If cat can be successfully matched, the second \w* consumes the remaining letters, if any, in the 6-letter word. After that, the last \b in the regex is guaranteed to match where the second \b inside the lookahead matched. Our double-requirement-regex has matched successfully.

## Optimizing Our Solution

While the above regex works just fine, it is not the most optimal solution. This is not a problem if you are just doing a search in a text editor. But optimizing things is a good idea if this regex will be used repeatedly and/or on large chunks of data in an application you are developing.

You can discover these optimizations by yourself if you carefully examine the regex and follow how the regex engine applies it, as we did above. The third and last \b are guaranteed to match. Since [word boundaries](https://www.regular-expressions.info/wordboundaries.html) are zero-length, and therefore do not change the result returned by the regex engine, we can remove them, leaving: (?=\b\w{6}\b)\w*cat\w*. Though the last \w* is also guaranteed to match, we cannot remove it because it adds characters to the regex match. Remember that the lookahead discards its match, so it does not contribute to the match returned by the regex engine. If we omitted the \w*, the resulting match would be the start of a 6-letter word containing “cat”, up to and including “cat”, instead of the entire word.

But we can optimize the first \w*. As it stands, it will match 6 letters and then backtrack. But we know that in a successful match, there can never be more than 3 letters before “cat”. So we can optimize this to \w{0,3}. Note that making the asterisk lazy would not have optimized this sufficiently. The lazy asterisk would find a successful match sooner, but if a 6-letter word does not contain “cat”, it would still cause the regex engine to try matching “cat” at the last two letters, at the last single letter, and even at one character beyond the 6-letter word.

So we have (?=\b\w{6}\b)\w{0,3}cat\w*. One last, minor, optimization involves the first \b. Since it is zero-length itself, there’s no need to put it inside the lookahead. So the final regex is: \b(?=\w{6}\b)\w{0,3}cat\w*.

You could replace the final \w* with \w{0,3} too. But it wouldn’t make any difference. The lookahead has already checked that we’re at a 6-letter word, and \w{0,3}cat has already matched 3 to 6 letters of that word. Whether we end the regex with \w* or \w{0,3} doesn’t matter, because either way, we’ll be matching all the remaining word characters. Because the resulting match and the speed at which it is found are the same, we may just as well use the version that is easier to type.

## A More Complex Problem

So, what would you use to find any word between 6 and 12 letters long containing either “cat”, “dog” or “mouse”? Again we have two requirements, which we can easily combine using a lookahead: \b(?=\w{6,12}\b)\w{0,9}(cat|dog|mouse)\w*. Very easy, once you get the hang of it. This regex will also put “cat”, “dog” or “mouse” into the first backreference.
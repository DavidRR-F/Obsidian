
# Character Classes or Character Sets

![](https://www.regular-expressions.info/img/bulb.png)

With a “character class”, also called “character set”, you can tell the regex engine to match only one out of several characters. Simply place the characters you want to match between square brackets. If you want to match an a or an e, use [ae]. You could use this in gr[ae]y to match either gray or grey. Very useful if you do not know whether the document you are searching through is written in American or British English.

A character class matches only a single character. gr[ae]y does not match graay, graey or any such thing. The order of the characters inside a character class does not matter. The results are identical.

You can use a hyphen inside a character class to specify a range of characters. [0-9] matches a _single_ digit between 0 and 9. You can use more than one range. [0-9a-fA-F] matches a single hexadecimal digit, case insensitively. You can combine ranges and single characters. [0-9a-fxA-FX] matches a hexadecimal digit or the letter X. Again, the order of the characters and the ranges does not matter.

Character classes are one of the most commonly used features of regular expressions. You can find a word, even if it is misspelled, such as sep[ae]r[ae]te or li[cs]en[cs]e. You can find an identifier in a programming language with [A-Za-z_][A-Za-z_0-9]*. You can find a C-style hexadecimal number with 0[xX][A-Fa-f0-9]+.

## Negated Character Classes

Typing a caret after the opening square bracket negates the character class. The result is that the character class matches any character that is _not_ in the character class. Unlike the [dot](https://www.regular-expressions.info/dot.html), negated character classes also match (invisible) line break characters. If you don’t want a negated character class to match line breaks, you need to include the line break characters in the class. [^0-9\r\n] matches any character that is not a digit or a line break.

It is important to remember that a negated character class still must match a character. q[^u] does _not_ mean: “a q not followed by a u”. It means: “a q followed by a character that is not a u”. It does not match the q in the string Iraq. It does match the q and the space after the q in Iraq is a country. Indeed: the space becomes part of the overall match, because it is the “character that is not a u” that is matched by the negated character class in the above regexp. If you want the regex to match the q, and only the q, in both strings, you need to use [negative lookahead](https://www.regular-expressions.info/lookaround.html): q(?!u). But we will get to that later.

## Metacharacters Inside Character Classes

In most regex flavors, the only special characters or metacharacters inside a character class are the closing bracket ], the backslash \, the caret ^, and the hyphen -. The [usual metacharacters](https://www.regular-expressions.info/characters.html#special) are normal characters inside a character class, and do not need to be escaped by a backslash. To search for a star or plus, use [+*]. Your regex will work fine if you escape the regular metacharacters inside a character class, but doing so significantly reduces readability.

To include a backslash as a character without any special meaning inside a character class, you have to escape it with another backslash. [\\x] matches a backslash or an x. The closing bracket ], the caret ^ and the hyphen - can be included by escaping them with a backslash, or by placing them in a position where they do not take on their special meaning. The [POSIX](https://www.regular-expressions.info/posix.html) and [GNU](https://www.regular-expressions.info/gnu.html) flavors are an exception. They treat backslashes in character classes as literal characters. So with these flavors, you can’t escape anything in character classes.

To include an unescaped caret as a literal, place it anywhere except right after the opening bracket. [x^] matches an x or a caret. This works with all flavors discussed in this tutorial.

You can include an unescaped closing bracket by placing it right after the opening bracket, or right after the negating caret. []x] matches a closing bracket or an x. [^]x] matches any character that is not a closing bracket or an x. This does not work in [JavaScript](https://www.regular-expressions.info/javascript.html), which treats [] as an empty character class that always fails to match, and [^] as a negated empty character class that matches any single character. [Ruby](https://www.regular-expressions.info/ruby.html) treats empty character classes as an error. So both JavaScript and Ruby require closing brackets to be escaped with a backslash to include them as literals in a character class.

The hyphen can be included right after the opening bracket, or right before the closing bracket, or right after the negating caret. Both [-x] and [x-] match an x or a hyphen. [^-x] and [^x-] match any character that is not an x or a hyphen. This works in all flavors discussed in this tutorial. Hyphens at other positions in character classes where they can’t form a range may be interpreted as literals or as errors. Regex flavors are quite inconsistent about this.

Many regex tokens that work outside character classes can also be used inside character classes. This includes character escapes, octal escapes, and hexadecimal escapes for [non-printable characters](https://www.regular-expressions.info/nonprint.html). For flavors that support [Unicode](https://www.regular-expressions.info/unicode.html), it also includes Unicode character escapes and Unicode properties. [$\u20AC] matches a dollar or euro sign, assuming your regex flavor supports Unicode escapes.

## Repeating Character Classes

If you repeat a character class by using the ?, * or + operators, you’re repeating the entire character class. You’re not repeating just the character that it matched. The regex [0-9]+ can match 837 as well as 222.

If you want to repeat the matched character, rather than the class, you need to use backreferences. ([0-9])\1+ matches 222 but not 837. When applied to the string 833337, it matches 3333 in the middle of this string. If you do not want that, you need to use [lookaround](https://www.regular-expressions.info/lookaround.html).

## Looking Inside The Regex Engine

As was mentioned earlier: the order of the characters inside a character class does not matter. gr[ae]y matches grey in Is his hair grey or gray?, because that is the _leftmost match_. We already saw [how the engine applies a regex consisting only of literal characters](https://www.regular-expressions.info/engine.html). Now we’ll see how it applies a regex that has more than one permutation. That is: gr[ae]y can match both gray and grey.

Nothing noteworthy happens for the first twelve characters in the string. The engine fails to match g at every step, and continues with the next character in the string. When the engine arrives at the 13th character, g is matched. The engine then tries to match the remainder of the regex with the text. The next token in the regex is the literal r, which matches the next character in the text. So the third token, [ae] is attempted at the next character in the text (e). The character class gives the engine two options: match a or match e. It first attempts to match a, and fails.

But because we are using a regex-directed engine, it must continue trying to match all the other permutations of the regex pattern before deciding that the regex cannot be matched with the text starting at character 13. So it continues with the other option, and finds that e matches e. The last regex token is y, which can be matched with the following character as well. The engine has found a complete match with the text starting at character 13. It returns grey as the match result, and looks no further. Again, the _leftmost match_ is returned, even though we put the a first in the character class, and gray could have been matched in the string. But the engine simply did not get that far, because another equally valid match was found to the left of it. gray is only matched if you tell the regex engine to continue looking for a second match in the remainder of the subject string after the first match.
## Character Class Subtraction

Character class subtraction is supported by the XML Schema, XPath, .NET (version 2.0 and later), and JGsoft regex flavors. It makes it easy to match any single character present in one list (the character class), but not present in another list (the subtracted class). The syntax for this is [class-[subtract]]. If the character after a hyphen is an opening bracket, these flavors interpret the hyphen as the subtraction operator rather than the range operator. You can use the full character class syntax within the subtracted character class.

The character class [a-z-[aeiuo]] matches a single letter that is not a vowel. In other words: it matches a single consonant. Without character class subtraction or intersection, the only way to do this would be to list all consonants: [b-df-hj-np-tv-z].

The character class [\p{Nd}-[^\p{IsThai}]] matches any single Thai digit. The base class matches any Unicode digit. All non-Thai characters are subtracted from that class. [\p{Nd}-[\P{IsThai}]] does the same. [\p{IsThai}-[^\p{Nd}]] and [\p{IsThai}-[\P{Nd}]] also match a single Thai digit by subtracting all non-digits from the Thai characters.
Nested Character Class Subtraction

Since you can use the full character class syntax within the subtracted character class, you can subtract a class from the class being subtracted. [0-9-[0-6-[0-3]]] first subtracts 0-3 from 0-6, yielding [0-9-[4-6]], or [0-37-9], which matches any character in the string 0123789.

The class subtraction must always be the last element in the character class. [0-9-[4-6]a-f] is not a valid regular expression. It should be rewritten as [0-9a-f-[4-6]]. The subtraction works on the whole class. E.g. [\p{Ll}\p{Lu}-[\p{IsBasicLatin}]] matches all uppercase and lowercase Unicode letters, except any ASCII letters. The \p{IsBasicLatin} is subtracted from the combination of \p{Ll}\p{Lu} rather than from \p{Lu} alone. This regex will not match abc.

While you can use nested character class subtraction, you cannot subtract two classes sequentially. To subtract ASCII characters and Greek characters from a class with all Unicode letters, combine the ASCII and Greek characters into one class, and subtract that, as in [\p{L}-[\p{IsBasicLatin}\p{IsGreek}]].
Negation Takes Precedence over Subtraction

The character class [^1234-[3456]] is both negated and subtracted from. In all flavors that support character class subtraction, the base class is negated before it is subtracted from. This class should be read as “(not 1234) minus 3456”. Thus this character class matches any character other than the digits 1, 2, 3, 4, 5, and 6.
Notational Compatibility with Other Regex Flavors

Note that a regex like [a-z-[aeiuo]] does not cause any errors in most regex flavors that do not support character class subtraction. But it won’t match what you intended either. In most flavors, this regex consists of a character class followed by a literal ]. The character class matches a character that is either in the range a-z, or a hyphen, or an opening bracket, or a vowel. Since the a-z range and the vowels are redundant, you could write this character class as [a-z-[] or [-[a-z] in Perl. A hyphen after a range is treated as a literal character, just like a hyphen immediately after the opening bracket. This is true in the XML, .NET and JGsoft flavors too. [a-z-_] matches a lowercase letter, a hyphen or an underscore in these flavors.

Strictly speaking, this means that the character class subtraction syntax is incompatible with Perl and the majority of other regex flavors. But in practice there’s no difference. Using non-alphanumeric characters in character class ranges is very bad practice because it relies on the order of characters in the ASCII character table. That makes the regular expression hard to understand for the programmer who inherits your work. While [A-[] would match any uppercase letter or an opening square bracket in Perl, this regex is much clearer when written as [A-Z[]. The former regex would cause an error with the XML, .NET and JGsoft flavors, because they interpret -[] as an empty subtracted class, leaving an unbalanced [.

# Character Class Intersection

![](https://www.regular-expressions.info/img/bulb.png)

Character class intersection is supported by [Java](https://www.regular-expressions.info/java.html), [JGsoft V2](https://www.regular-expressions.info/jgsoft.html#v2), and by [Ruby](https://www.regular-expressions.info/ruby.html) 1.9 and later. It makes it easy to match any single character that must be present in two sets of characters. The syntax for this is [class&&[intersect]]. You can use the full character class syntax within the intersected character class.

If the intersected class does not need a negating caret, then Java and Ruby allow you to omit the nested square brackets: [class&&intersect].

You cannot omit the nested square brackets in PowerGREP. If you do, PowerGREP interprets the ampersands as literals. So in PowerGREP [class&&intersect] is a character class containing only literals, just like [clas&inter].

The character class [a-z&&[^aeiuo]] matches a single letter that is not a vowel. In other words: it matches a single consonant. Without character class [subtraction](https://www.regular-expressions.info/charclasssubtract.html) or intersection, the only way to do this would be to list all consonants: [b-df-hj-np-tv-z].

The character class [\p{Nd}&&[\p{IsThai}]] matches any single Thai digit. [\p{IsThai}&&[\p{Nd}]] does exactly the same.

## Intersection of Multiple Classes

You can intersect the same class more than once. [0-9&&[0-6&&[4-9]]] is the same as [4-6] as those are the only digits present in all three parts of the intersection. In Java and Ruby you can write the same regex as [0-9&&[0-6]&&[4-9]], [0-9&&[0-6&&4-9]], [0-9&&0-6&&[4-9]], or just [0-9&&0-6&&4-9]. The nested square brackets are only needed if one of the parts of the intersection is negated.

If you do not use square brackets around the right hand part of the intersection, then there is no confusion that the entire remainder of the character class is the right hand part of the intersection. If you do use the square brackets, you could write something like [0-9&&[12]56]. In Ruby, this is the same as [0-9&&1256]. But Java has bugs that cause it to treat this as [0-9&&56], completely ignoring the nested brackets.

PowerGREP does not allow anything after the nested ]. The characters 56 in [0-9&&[12]56] are an error. This way there is no ambiguity about their meaning.

You also shouldn’t put && at the very start or very end of the regex. Ruby treats [0-9&&] and [&&0-9] as intersections with an empty class, which matches no characters at all. Java ignores leading and trailing && operators. PowerGREP treats them as literal ampersands.

## Intersection in Negated Classes

The character class [^1234&&[3456]] is both negated and intersected. In Java and PowerGREP, negation takes precedence over intersection. Java and PowerGREP read this regex as “(not 1234) and 3456”. Thus in Java and PowerGREP this class is the same as [56] and matches the digits 5 and 6. In Ruby, intersection takes precedence over negation. Ruby reads [^1234&&3456] as “not (1234 and 3456)”. Thus in Ruby this class is the same as [^34] which matches anything except the digits 3 and 4.

If you want to negate the right hand side of the intersection, then you must use square brackets. Those automatically control precedence. So Java, PowerGREP, and Ruby all read [1234&&[^3456]] as “1234 and (not 3456)”. Thus this regex is the same as [12].

## Notational Compatibility with Other Regex Flavors

The ampersand has no special meaning in character classes in any other regular expression flavors discussed in this tutorial. The ampersand is simply a literal, and repeating it just adds needless duplicates. All these flavors treat [1234&&3456] as identical to [&123456].

Strictly speaking, this means that the character class intersection syntax is incompatible with the majority of other regex flavors. But in practice there’s no difference, because there is no point in using two ampersands in a character class when you just want to add a literal ampersand. A single ampersand is still treated as a literal by Java, Ruby, and PowerGREP.

# Shorthand Character Classes

![](https://www.regular-expressions.info/img/bulb.png)

Since certain character classes are used often, a series of shorthand character classes are available. \d is short for [0-9]. In most flavors that support Unicode, \d includes all digits from all scripts. Notable exceptions are [Java](https://www.regular-expressions.info/java.html), [JavaScript](https://www.regular-expressions.info/javascript.html), and [PCRE](https://www.regular-expressions.info/pcre.html). These Unicode flavors match only ASCII digits with \d.

\w stands for “word character”. It always matches the ASCII characters [A-Za-z0-9_]. Notice the inclusion of the underscore and digits. In most flavors that support Unicode, \w includes many characters from other scripts. There is a lot of inconsistency about which characters are actually included. Letters and digits from alphabetic scripts and ideographs are generally included. Connector punctuation other than the underscore and numeric symbols that aren’t digits may or may not be included. [XML Schema](https://www.regular-expressions.info/xml.html) and [XPath](https://www.regular-expressions.info/xpath.html) even include all symbols in \w. Again, [Java](https://www.regular-expressions.info/java.html), [JavaScript](https://www.regular-expressions.info/javascript.html), and [PCRE](https://www.regular-expressions.info/pcre.html) match only ASCII characters with \w.

\s stands for “whitespace character”. Again, which characters this actually includes, depends on the regex flavor. In all flavors discussed in this tutorial, it includes [ \t\r\n\f]. That is: \s matches a space, a tab, a carriage return, a line feed, or a form feed. Most flavors also include the vertical tab, with [Perl](https://www.regular-expressions.info/perl.html) (prior to version 5.18) and [PCRE](https://www.regular-expressions.info/pcre.html) (prior to version 8.34) being notable exceptions. In flavors that support Unicode, \s normally includes all characters from the Unicode “separator” category. [Java](https://www.regular-expressions.info/java.html) and [PCRE](https://www.regular-expressions.info/pcre.html) are exceptions once again. But [JavaScript](https://www.regular-expressions.info/javascript.html) does match all Unicode whitespace with \s.

Shorthand character classes can be used both inside and outside the square brackets. \s\d matches a whitespace character followed by a digit. [\s\d] matches a single character that is either whitespace or a digit. When applied to 1 + 2 = 3, the former regex matches  2 (space two), while the latter matches 1 (one). [\da-fA-F] matches a hexadecimal digit, and is equivalent to [0-9a-fA-F] if your flavor only matches ASCII characters with \d.

## Negated Shorthand Character Classes

The above three shorthands also have negated versions. \D is the same as [^\d], \W is short for [^\w] and \S is the equivalent of [^\s].

Be careful when using the negated shorthands inside square brackets. [\D\S] is _not_ the same as [^\d\s]. The latter matches any character that is neither a digit nor whitespace. It matches x, but not 8. The former, however, matches any character that is either not a digit, or is not whitespace. Because all digits are not whitespace, and all whitespace characters are not digits, [\D\S] matches any character; digit, whitespace, or otherwise.

## More Shorthand Character Classes

While support for \d, \s, and \w is quite universal, there are some regex flavors that support additional shorthand character classes. [Perl](https://www.regular-expressions.info/perl.html) 5.10 introduced \h and \v. \h matches horizontal whitespace, which includes the tab and all characters in the “space separator” Unicode category. It is the same as [\t\p{Zs}]. \v matches “vertical whitespace”, which includes all characters treated as line breaks in the Unicode standard. It is the same as [\n\cK\f\r\x85\x{2028}\x{2029}].

[PCRE](https://www.regular-expressions.info/pcre.html) also supports \h and \v starting with version 7.2. [PHP](https://www.regular-expressions.info/php.html) does as of version 5.2.2, [Java](https://www.regular-expressions.info/java.html) as of version 8, and the [JGsoft engine](https://www.regular-expressions.info/jgsoft.html) as of version 2.

If your flavor supports \h and \v then you should definitely use them instead of \s whenever you want to match only one type of whitespace. Using \h instead of \s to match spaces and tabs makes sure your regex match doesn’t accidentally spill into the next line.

In many other regex flavors, \v matches only the [vertical tab](https://www.regular-expressions.info/nonprint.html) character. Perl, PCRE, and PHP never supported this, so they were free to give \v a different meaning. Java 4 to 7 and JGsoft V1 did use \v to match only the vertical tab. Java 8 and JGsoft V2 changed the meaning of this token anyway. The vertical tab is also a vertical whitespace character. To avoid confusion, the above paragraph uses \cK to represent the vertical tab.

[Boost](https://www.regular-expressions.info/boost.html) supports \h starting with version 1.42. Boost 1.42 and later support \v as a shorthand only outside character classes. [\v] matches only the vertical tab in Boost.

[Ruby](https://www.regular-expressions.info/ruby.html) 1.9 and later have their own version of \h. It matches a single hexadecimal digit just like [0-9a-fA-F]. \v is a vertical tab in Ruby.

## XML Character Classes

[XML Schema](https://www.regular-expressions.info/xml.html), [XPath](https://www.regular-expressions.info/xpath.html), and [JGsoft V2](https://www.regular-expressions.info/jgsoft.html#v2) regular expressions support four more shorthands that aren’t supported by any other regular expression flavors. \i matches any character that may be the first character of an XML name. \c matches any character that may occur after the first character in an XML name. \I and \C are the respective negated shorthands. Note that the \c shorthand syntax conflicts with the [control character](https://www.regular-expressions.info/nonprint.html) syntax used in many other regex flavors.

You can use these four shorthands both inside and outside character classes using the bracket notation. They’re very useful for validating XML references and values in your XML schemas. The regular expression \i\c* matches an XML name like xml:schema.

The regex <\i\c*\s*> matches an opening XML tag without any attributes. </\i\c*\s*> matches any closing tag. <\i\c*(\s+\i\c*\s*=\s*("[^"]*"|'[^']*'))*\s*> matches an opening tag with any number of attributes. Putting it all together, <(\i\c*(\s+\i\c*\s*=\s*("[^"]*"|'[^']*'))*|/\i\c*)\s*> matches either an opening tag with attributes or a closing tag.

No other regex flavors discussed in this tutorial support XML character classes. If your XML files are plain ASCII , you can use [_:A-Za-z] for \i and [-._:A-Za-z0-9] for \c. If you want to allow all Unicode characters that the XML standard allows, then you will end up with some pretty long regexes. Instead of \i you would use:

[:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD]

Instead of \c you would use:

[-.0-9:A-Z_a-z\u00B7\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u037D\u037F-\u1FFF\u200C-\u200D\u
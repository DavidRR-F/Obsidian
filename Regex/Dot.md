# The Dot Matches (Almost) Any Character

![](https://www.regular-expressions.info/img/bulb.png)

In regular expressions, the dot or period is one of the most commonly used [metacharacters](https://www.regular-expressions.info/characters.html#special). Unfortunately, it is also the most commonly misused metacharacter.

The dot matches a single character, without caring what that character is. The only exception are line break characters. In all regex flavors discussed in this tutorial, the dot does _not_ match line breaks by default.

This exception exists mostly because of historic reasons. The first tools that used regular expressions were line-based. They would read a file line by line, and apply the regular expression separately to each line. The effect is that with these tools, the string could never contain line breaks, so the dot could never match them.

Modern tools and languages can apply regular expressions to very large strings or even entire files. Except for [VBScript](https://www.regular-expressions.info/vbscript.html), all regex flavors discussed here have an option to make the dot match all characters, including line breaks. Older implementations of [JavaScript](https://www.regular-expressions.info/javascript.html) don’t have the option either. It was formally added in the ECMAScript 2018 specification.

In PowerGREP, tick the checkbox labeled “dot matches line breaks” to make the dot match all characters. In EditPad Pro, turn on the “Dot” or “Dot matches newline” search option.

In Perl, the mode where the dot also matches line breaks is called “single-line mode”. This is a bit unfortunate, because it is easy to mix up this term with “multi-line mode”. Multi-line mode only affects [anchors](https://www.regular-expressions.info/anchors.html), and single-line mode only affects the dot. You can activate single-line mode by adding an s after the regex code, like this: m/^regex$/s;.

Other languages and regex libraries have adopted Perl’s terminology. When using the [.NET’s Regex class](https://www.regular-expressions.info/dotnet.html) you activate this mode by specifying RegexOptions.Singleline, such as in Regex.Match("string", "regex", RegexOptions.Singleline).

In [JavaScript](https://www.regular-expressions.info/javascript.html) (for compatibility with older browsers) and [VBScript](https://www.regular-expressions.info/vbscript.html) you can use a [character class](https://www.regular-expressions.info/charclass.html) such as [\s\S] to match any character. This character matches a character that is either a whitespace character (including line break characters), or a character that is not a whitespace character. Since all characters are either whitespace or non-whitespace, this character class matches any character. Do not use alternation like (\s|\S) which is [slow](https://www.regular-expressions.info/toolong.html). And certainly don’t use (.|\s) which can lead to [catastrophic backtracking](https://www.regular-expressions.info/catastrophic.html) as spaces and tabs can be matched by both . and \s.

In all of [Boost](https://www.regular-expressions.info/boost.html)’s regex grammars the dot matches line breaks by default. Boost’s ECMAScript grammar allows you to turn this off with regex_constants::no_mod_m.

## Line Break Characters

While support for the dot is universal among regex flavors, there are significant differences in which characters they treat as line break characters. All flavors treat the newline \n as a line break. UNIX text files terminate lines with a single newline. All the scripting languages discussed in this tutorial do not treat any other characters as line breaks. This isn’t a problem even on Windows where text files normally break lines with a \r\n pair. That’s because these scripting languages read and write files in _text mode_ by default. When running on Windows, \r\n pairs are automatically converted into \n when a file is read, and \n is automatically written to file as \r\n.

[std::regex](https://www.regular-expressions.info/stdregex.html), [XML Schema](https://www.regular-expressions.info/xml.html) and [XPath](https://www.regular-expressions.info/xpath.html) also treat the carriage return \r as a line break character. [JavaScript](https://www.regular-expressions.info/javascript.html) adds the Unicode line separator \u2028 and paragraph separator \u2029 on top of that. [Java](https://www.regular-expressions.info/java.html) includes these plus the Latin-1 next line control character \u0085. [Boost](https://www.regular-expressions.info/boost.html) adds the form feed \f to the list. Only [Delphi](https://www.regular-expressions.info/delphi.html) and the [JGsoft flavor](https://www.regular-expressions.info/jgsoft.html) supports all Unicode line breaks, completing the mix with the vertical tab.

[.NET](https://www.regular-expressions.info/dotnet.html) is notably absent from the list of flavors that treat characters other than \n as line breaks. Unlike scripting languages that have their roots in the UNIX world, .NET is a Windows development framework that does not automatically strip carriage return characters from text files that it reads. If you read a Windows text file as a whole into a string, it will contain carriage returns. If you use the regex abc.* on that string, without setting RegexOptions.SingleLine, then it will match abc plus all characters that follow on the same line, plus the carriage return at the end of the line, but without the newline after that.

Some flavors allow you to control which characters should be treated as line breaks. Java has the UNIX_LINES option which makes it treat only \n as a line break. [PCRE](https://www.regular-expressions.info/pcre.html) has options that allow you to choose between \n only, \r only, \r\n, or all Unicode line breaks.

On [POSIX](https://www.regular-expressions.info/posix.html) systems, the POSIX locale determines which characters are line breaks. The C locale treats only the newline \n as a line break. Unicode locales support all Unicode line breaks.

## \N Never Matches Line Breaks

Perl 5.12 and PCRE 8.10 introduced \N which matches any single character that is not a line break, just like the dot does. Unlike the dot, \N is not affected by “single-line mode”. (?s)\N. turns on single-line mode and then matches any character that is not a line break followed by any character regardless of whether it is a line break.

PCRE’s options that control which characters are treated as line breaks affect \N in exactly the same way as they affect the dot.

PHP 5.3.4 and R 2.14.0 also support \N as their regex support is based on PCRE 8.10 or later. JGsoft V2 also supports \N.
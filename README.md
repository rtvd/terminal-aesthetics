# Terminal Aesthetics

## Introduction

This repository contains my rather opinionated notes on aesthetics and usability of computer terminals,
as well as tools helpful in exploring their capabilities.

There is a variety of terminals. Some of them are pretty esoteric and may have weird and wonderful capabilities. 
However, for the time being, only plain text terminals like UNIX consoles are covered here.

## Tools

The tools are expected to run on any UNIX system, including Linux.

### ansi_demo.sh

ansi_demo.sh is a shell script which demonstrates how do various combinations of text colours and text backgrounds
look like, as well as demonstrates normal, bold, and faint text.

### text_legibility.sh

text_legibility.sh is another shell script, aiming at demonstrating how would text look like on a terminal in a
more casual case: coloured background is almost not used, coloured text is used sparingly.

## Terminal Capabilities and ANSI Escape Codes

Terminals mainly show text, but there is also wide range of useful features which can be supported by a terminal to
improve its usefulness, such as:

* ability to select among various fonts
* font effects, such as underline, italic font, bold or faint text, etc.
* coloured text and background
* programmatic control over cursor's position

These features are normally controlled via special character sequences.
The de-facto way of doing it is called [ANSI escape codes](https://en.wikipedia.org/wiki/ANSI_escape_code).

The support for these features varies among terminals.
This creates a problem, as it is never clear which features one can rely upon.

In the beginning, when terminals where physical devices, the available features were quite limited.
What little was available, was a reflection of capabilities of the devices.
The matters of usability and aesthetics were not the first concern.

Over time, hardware became more capable and eventually terminals running in a graphical environment were created.
Those terminals were essentially unrestricted in what they could achieve.
However, they also had to carry the baggage of backwards compatibility.

## Features of Interest

### Bold Font

The least intrusive way of highlighting or de-emphasising parts of text using bold / faint fonts.

Some basic text mode hardware may be unable to support multiple font weights directly, however.
In such cases the hardware terminals would have to simulate these features by using a different colour.

As for software terminals running in a graphical environment, there should be no technical problem in using actual
bold and faint fonts. Even were such fonts are not available, it is still possible to simulate them on pretty much
any modern hardware.

### Coloured Text and Background

ANSI standard defines eight colours for both text and background. This is what is called "3-bit colours".
The standard also mentions "default" text and background colours, but does not require a terminal to tie those to any
of the eight colours.

It is safe to assume that every modern terminal can support 3-bit colour selection. However, it is not safe to make
assumptions regarding the appearance of the colours.

Almost all terminals also support additional eight "bright" colours, giving sixteen in total (plus default colours).
This is called "4-bit colours". There is no specific definition of what "bright" means, but intuitively the bright
colours must be catching attention more.

Almost all modern terminals also support 24-bit colours, where colours of both text and background can be specified
as triplets of 8-bit numbers.

For historical reasons, initially terminals used to show bright text (white / green / orange) on a black background.
As colours were added, the assumption that the background is black stayed. So "bright" colours also meant "lighter".

## Practical Aspects and Aesthetics

### White on Black vs Black on White

Due to the way human vision works, reading bright text on a black background is tiring and relatively damaging for eyes.
The reason for it is simple: eyes adapt to the overall brightness of image, so when looking at a largely black screen
the pupil opens up to let more light in. This results in bright light of letters hitting retina hard.
For the same reasons it is also beneficial to work in a well lit environment.

Reading black text on white background has its own downsides. Unfortunately, computer screens are emissive rather than
reflective. Looking at a bright white screen is a bit like looking at an electric bulb. It causes strain on the eye
muscles, which is not great.

Therefore, ideally the background has to be neither plain black nor plain white.
Perhaps the ideal background would have a luminance close but slightly higher than that of surroundings.   

### Contrast

By choosing a less extreme background we pay the cost in the reduction of contrast.

Some believe that it is high contrast that hurts their eyes. You can see that the idea is wrong by looking at
a black printed text on a white sheet of paper. That combination is perfect.

On the other hand, low contrast text is certainly tiring for eyes.

World Wide Web Consortium provide [guidelines](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)
on the minimum required contrast and how to measure it. The requirements depend on the font size and person's health,
but crucially the contrast matters and so it is not appropriate to decrease it too much.

By the way, when talking about contrast it is important to understand that there are multiple definitions of contrast.
W3C provide theirs, based on values of R, G, and B components and likely assuming sRGB colour space and standard viewing
conditions. There are other definitions too. 

### Human Vision

Human vision is a very complicated topic and there is an ongoing research into the way it works.
As this research progresses, new models are being designed.
You can read about it [here](https://en.wikipedia.org/wiki/Color_appearance_model).

In a few words, the same text would look different depending on the background, how well lit is the background, and what
are the colours of the text and the background. Naturally, these matters were not taken into account when the first
terminals were created.

### Back to Black on White

As initially the terminals were of a "white on black" kind, the additional "bright" colours of 4-bit palettes were
closer in brightness to foreground than to the background (as compared to "normal" colours).

As "black on white" colour schemas invert background and foreground, there is a question of what does "bright" mean
in the context of those schemes. Lighter colours are closer to foreground rather than background now.
Perhaps the best way of dealing with it is to make use of
[Helmholtz–Kohlrausch effect](https://en.wikipedia.org/wiki/Helmholtz%E2%80%93Kohlrausch_effect) and ensure that the
"bright" colours have the strongest saturation.

### More on Colour

Colours have their semantic load. While it is somewhat culture-dependent, it is pretty fair to assume that "red" means
danger or problem while "green" and "blue" may represent "safety". "Yellow" may sometimes be used to represent a
warning. Therefore, it is important for terminal colour schemes to show ANSI colours faithfully, and at least with a
correct hue.

If you are designing a colour scheme, please do avoid using red and yellow for things not associated with danger.

When considering a palette for a terminal, it makes sense to set the priorities right:
1. Default text on default background must have perfect readability.
2. Text coloured with "normal" colours must also look very good on default background, although it may have poorer contrast.
3. Text coloured with "bright" colours must attract more attention when on default background, but its readability may be even worse.
4. Default text on any coloured backgrounds (except for black/white colours) must be readable.
5. Coloured text on coloured background are not important.

Also, when designing palettes and colour schemes, it is best to assume that some users are colour-impaired.
The safest route is so consider how would a palette or colour scheme look if a person has no ability to perceive colours
at all and the only visible aspect of the image is lightness/brightness.

### Bold / Italic / Faint

The first thing to note is that not all of these font effects are universally possible.
Italic fonts are possible in European languages but not really an option in Chinese or Japanese.
There is also no clear semantic meaning to italic text.
Therefore, it is good when it is supported, but not much of a problem when it is not.

Bold text, however, is much more important. Its semantic meaning is also clear: highlighting specific parts of text.
The beautiful thing about bold text is that you can count on it being more visible no matter what colour are the text
and the background.

Unfortunately, many terminals see "bold" attribute as an invitation to switch the text colour from "normal" to
"bright" colour, which is a messy approach.

Faint text attribute also has a semantic meaning: the text is de-emphasised, so it probably is a comment of sorts,
not essential  for reading most of the time.
Unfortunately, few terminals support faint text attribute and those which do, may support it incorrectly.
Also note that it is not appropriate to implement this as a darker colour of text, as it would work wrong with
back-on-white colour schemas. The correct implementation should be drawing this text with less than 100% of opacity.

## Missing Features

### 'Bright' Default Background

Unfortunately, there is nothing in the standard that would support a notion of a 'bright' or 'highlighted' background.
Yes, you can select a bright colour for a background, but there is no guarantee it would work well with the text in
default colour.

At the same time, the feature would be very useful. For example, when searching for occurrences of a
text, various programs may need to highlight the matches. Often it is done by either showing the text in bold or
by changing the colour of text to something catchy. Both approaches seem lacking the required visual power and
semantic precision.

Ideally, it should be possible to highlight the matches by changing background to a 'bright' version, so that
the contrast  between the background and the text would increase.
In the same way, 'bright' foreground may also be useful. Here, 'bright' does not necessarily mean 'lighter'. It means
that the colour should have a higher contrast on the default background.
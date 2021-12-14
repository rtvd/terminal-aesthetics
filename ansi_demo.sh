#!/bin/sh

#       Author: Denys Rtveliashvili
#      License: GNU General Public License v3 (https://www.gnu.org/licenses/gpl-3.0.en.html)
#          URL: https://github.com/rtvd/terminal-aesthetics
#
#  Inspired by: similar program by Giles Orr (http://gilesorr.com)

: '

The code prints our test text using various text attributes and on different background.
The code varies colours of both text and background, showing all 16 ANSI colours for each (both 8 normal and
8 "bright" ones), as well as default colours.

Note, that some terminals text using "bright" colours instead of using a bold font.
This may make sense on old text-only terminals but it should not make sense in any terminals running in a modern
graphical environment.

Similarly, some terminals may use special "faint" colours (which are not a part of ANSI standard) to simulate a
rarely used "faint text" attribute. This does not seem like a good approach.

'

print_palette ()
{
  TEST_TXT='aWm@*DEw'
  INDENT='                        '
  BG_CODES_LIST="$1"
  echo "$INDENT  black     red     green   yellow    blue    magenta   cyan    white   default  "

  printf "%s" "$INDENT"
  echo "$BG_CODES_LIST" | while read BG_CODE
  do
    printf "%5sm   " "$BG_CODE"
  done
  echo ""

  for FG_CODE in $(seq 30 37; echo 39; seq 90 97)
  do
    case $FG_CODE in
      39) FG_NAME="DEFAULT" ;;
      30) FG_NAME="black" ;;
      31) FG_NAME="red" ;;
      32) FG_NAME="green" ;;
      33) FG_NAME="yellow" ;;
      34) FG_NAME="blue" ;;
      35) FG_NAME="magenta" ;;
      36) FG_NAME="cyan" ;;
      37) FG_NAME="white" ;;
      90) FG_NAME="int black" ;;
      91) FG_NAME="int red" ;;
      92) FG_NAME="int green" ;;
      93) FG_NAME="int yellow" ;;
      94) FG_NAME="int blue" ;;
      95) FG_NAME="int magenta" ;;
      96) FG_NAME="int cyan" ;;
      97) FG_NAME="int white" ;;
      *) FG_NAME="?" ;;
    esac
    for STYLE_CODE in 2 0 1
    do
    case $STYLE_CODE in
      0) STYLE_NAME="normal" ;;
      1) STYLE_NAME="bold" ;;
      2) STYLE_NAME="faint" ;;
      *) STYLE_NAME="?" ;;
    esac
      printf " %sm %6s \033[${STYLE_CODE};${FG_CODE}m%-11s \033[0m" "$FG_CODE" "$STYLE_NAME" "$FG_NAME"
      echo "$BG_CODES_LIST" | while read BG_CODE
      do
        printf "\033[${STYLE_CODE};${FG_CODE};${BG_CODE}m${TEST_TXT}\033[0m " "$BG_CODE"
      done
      printf "\033[0m\n"
    done
  done
}

printf "=== \033[1mPalette of 'normal' background colours\033[0m ===\n"
print_palette "$(seq 40 47; echo 49)"

echo ""
echo ""

printf "=== \033[1mPalette of 'bright' background colours\033[0m ===\n"
print_palette "$(seq 100 107; echo 49)"

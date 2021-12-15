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

SHOW_FAINT=1
SHOW_NORMAL=1
SHOW_BOLD=1
for cmd_arg in $@
do
  [ $cmd_arg = '--no-faint' ] && SHOW_FAINT=0
  [ $cmd_arg = '--no-normal' ] && SHOW_NORMAL=0
  [ $cmd_arg = '--no-bold' ] && SHOW_BOLD=0
  if [ $cmd_arg = '--help' ]
  then
    cat <<EOF
The program prints out coloured text on coloured background using ANSI codes.
By default, it prints text with three font weights: faint, normal, and bold.

The following command line arguments are supported:

  --help        - to show this text
  --no-faint   - to skip printing 'faint' text
  --no-normal  - to skip printing 'normal' text
  --no-bold    - to skip printing 'bold' text
EOF
    exit 0
  fi
done

TEST_TXT='Wm@*E'
INDENT='                    '

print_palette_segment ()
{
  BG_CODES_LIST="$1"
  FG_CODES_LIST="$2"

  for FG_CODE in $FG_CODES_LIST
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
      90) FG_NAME="br.black" ;;
      91) FG_NAME="br.red" ;;
      92) FG_NAME="br.green" ;;
      93) FG_NAME="br.yllw" ;;
      94) FG_NAME="br.blue" ;;
      95) FG_NAME="br.mgnta" ;;
      96) FG_NAME="br.cyan" ;;
      97) FG_NAME="br.white" ;;
      *) FG_NAME="?" ;;
    esac

    for STYLE_CODE in 2 0 1
    do
      [ $STYLE_CODE -eq 2 ] && [ $SHOW_FAINT -eq 0 ] && continue
      [ $STYLE_CODE -eq 0 ] && [ $SHOW_NORMAL -eq 0 ] && continue
      [ $STYLE_CODE -eq 1 ] && [ $SHOW_BOLD -eq 0 ] && continue

      case $STYLE_CODE in
        0) STYLE_NAME="normal" ;;
        1) STYLE_NAME="bold" ;;
        2) STYLE_NAME="faint" ;;
        *) STYLE_NAME="?" ;;
      esac

      printf "%sm %6s \033[${STYLE_CODE};${FG_CODE}m%-8s \033[0m" "$FG_CODE" "$STYLE_NAME" "$FG_NAME"
      for BG_CODE in $BG_CODES_LIST
      do
        printf "\033[${STYLE_CODE};${FG_CODE};${BG_CODE}m${TEST_TXT}\033[0m " "$BG_CODE"
      done
      printf "\033[0m\n"
    done
  done
}

print_palette ()
{
  BG_CODES_LIST="$1"

  echo "${INDENT}black  red  green yellw blue  mgnta cyan  white deflt"

  printf "%s" "$INDENT"
  for BG_CODE in $BG_CODES_LIST
  do
    printf "%3sm  " "$BG_CODE"
  done
  echo ""

  print_palette_segment "$BG_CODES_LIST" "$(seq 30 37)"  # normal foreground colours
  echo ""
  print_palette_segment "$BG_CODES_LIST" "39"            # default foreground colours
  echo ""
  print_palette_segment "$BG_CODES_LIST" "$(seq 90 97)"  # bright foreground colours
}

printf "=== \033[1mPalette of 'normal' background colours\033[0m ===\n"
print_palette "$(seq 40 47; echo 49)"

echo ""
echo ""

printf "=== \033[1mPalette of 'bright' background colours\033[0m ===\n"
print_palette "$(seq 100 107; echo 49)"

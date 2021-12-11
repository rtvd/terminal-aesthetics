#!/bin/sh

#       Author: Denys Rtveliashvili
#      License: GNU General Public License v3 (https://www.gnu.org/licenses/gpl-3.0.en.html)
#          URL: https://github.com/rtvd/terminal-aesthetics


echo "\n\033[4mDefault text with some words in bold\033[0m:"

echo "
Lorem ipsum dolor sit amet, consectetur adipiscing elit. \033[1mCurabitur dictum\033[0m turpis lacus, eget venenatis turpis hendrerit nec. Quisque in vestibulum quam. Sed venenatis, lorem eget volutpat ullamcorper, risus tortor tempus urna, in rhoncus urna massa et mauris. Ut bibendum a eros sit amet pellentesque. Fusce lorem nisl, eleifend et magna sit amet, ultricies posuere leo. Vivamus ut sapien lacus. Nullam \033[1mtortor quam\033[0m, maximus semper velit a, pellentesque lobortis diam. Curabitur viverra ligula vel augue suscipit auctor. Aenean fermentum placerat massa, non venenatis elit mattis ac. \033[1mAenean interdum in nunc nec fringilla.\033[0m Quisque est nibh, laoreet et enim quis, volutpat consequat sapien. Donec purus risus, consectetur efficitur ex vitae, ornare pulvinar erat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut eget congue sapien. Nam tempor ultricies dolor vitae malesuada. Nunc venenatis maximus condimentum.
"

echo "\n\033[2mThis text should be 'faint', if your terminal supports it.\033[0m\n"

echo "\033[4mDemonstration of coloured texts\033[0m:\nThe text will be doubled. The second one shows 'bright' colours.\n"

echo "
Donec \033[1;30mblack \033[22mtext\033[0m, metus ac posuere elementum, purus ante \033[1;31mred \033[22mtext\033[0m tincidunt risus, ac sagittis lectus velit nec nisl. Nulla \033[1;32mgreen \033[22mtext\033[0m vitae velit ipsum. Duis non \033[1;33myellow \033[22mtext\033[0m volutpat eros, sed scelerisque lacus. Vestibulum nunc lectus, \033[1;34mblue \033[22mtext\033[0m aliquam eu consectetur vitae, interdum vel lacus. Pellentesque sit amet ipsum ultricies, \033[1;35mmagenta \033[22mtext\033[0m blandit arcu sed, molestie lorem. Mauris malesuada eget sapien \033[1;36mcyan \033[22mtext\033[0m eu mattis. Vivamus eget ante \033[1;37mwhite \033[22mtext\033[0m  ut mauris venenatis sodales.
"
echo "
Donec \033[1;90mblack \033[22mtext\033[0m, metus ac posuere elementum, purus ante \033[1;91mred \033[22mtext\033[0m tincidunt risus, ac sagittis lectus velit nec nisl. Nulla \033[1;92mgreen \033[22mtext\033[0m vitae velit ipsum. Duis non \033[1;93myellow \033[22mtext\033[0m volutpat eros, sed scelerisque lacus. Vestibulum nunc lectus, \033[1;94mblue \033[22mtext\033[0m aliquam eu consectetur vitae, interdum vel lacus. Pellentesque sit amet ipsum ultricies, \033[1;95mmagenta \033[22mtext\033[0m blandit arcu sed, molestie lorem. Mauris malesuada eget sapien \033[1;96mcyan \033[22mtext\033[0m eu mattis. Vivamus eget ante \033[1;97mwhite \033[22mtext\033[0m  ut mauris venenatis sodales.
"
printf "\033[4mDemonstration of coloured backgrounds\033[0m:\nThe text will be doubled. The second one shows 'bright' colours.\n"

echo "
Donec \033[1;40mblack \033[22mbackground\033[0m, metus ac posuere elementum, purus ante \033[1;41mred \033[22mbackground\033[0m tincidunt risus, ac sagittis lectus velit nec \033[1;42mgreen \033[22mbackground\033[0m nisl. Nulla vitae velit \033[1;43myellow \033[22mbackground\033[0m ipsum. Duis non volutpat eros, sed scelerisque \033[1;44mblue \033[22mbackground\033[0m lacus. Vestibulum nunc lectus, aliquam eu consectetur vitae, interdum vel lacus. Pellentesque sit amet ipsum ultricies, blandit arcu sed, molestie \033[1;45mmagenta \033[22mbackground\033[0m lorem. Mauris malesuada eget sapien \033[1;46mcyan \033[22mbackground\033[0m eu mattis. Vivamus eget ante \033[1;47mwhite \033[22mbackground\033[0m  ut mauris venenatis sodales.
"
echo "
Donec \033[1;100mblack \033[22mbackground\033[0m, metus ac posuere elementum, purus ante \033[1;101mred \033[22mbackground\033[0m tincidunt risus, ac sagittis lectus velit nec \033[1;102mgreen \033[22mbackground\033[0m nisl. Nulla vitae velit \033[1;103myellow \033[22mbackground\033[0m ipsum. Duis non volutpat eros, sed scelerisque \033[1;104mblue \033[22mbackground\033[0m lacus. Vestibulum nunc lectus, aliquam eu consectetur vitae, interdum vel lacus. Pellentesque sit amet ipsum ultricies, blandit arcu sed, molestie \033[1;105mmagenta \033[22mbackground\033[0m lorem. Mauris malesuada eget sapien \033[1;106mcyan \033[22mbackground\033[0m eu mattis. Vivamus eget ante \033[1;107mwhite \033[22mbackground\033[0m  ut mauris venenatis sodales.
"
printf "\033[4mDemonstration of a text in non-latin characters\033[0m:\n"

echo "
\033[1m羅生門\033[0m

芥川龍之介

　或日の暮方の事である。一人の下人が、羅生門の下で雨やみを待っていた。　広い門
の下には、この男の外に誰もいない。ただ、所々丹塗の剥げた、大きな円柱に、きりぎ
りすが一匹とまっている。羅生門が、朱雀大路にある以上は、この男の外にも、雨やみ
をする市女笠や揉烏帽子が、もう二三人はありそうなものである。それが、この男の外
に誰もいない。
"
# MyFreeCloudVM

![](https://i.ibb.co/fp6PMws/c6f983f9-8076-48f3-8e99-10cb787a2343-removebg-preview-1.png)

![](https://img.shields.io/github/stars/DonDoesStuff/MyFreeCloudVM) [![Pizza's made by](https://img.shields.io/badge/Pizza's_made_by-Don's_grandma-orange)](https://emojipedia.org/old-woman/)

[![Donate](https://img.shields.io/badge/Donate-TRX-red)](https://whispering-jealous-maize.glitch.me/trx.html) [![Donate](https://img.shields.io/badge/Donate-LTC-blue)](https://whispering-jealous-maize.glitch.me/ltc.html) [![Donate](https://img.shields.io/badge/Donate-BTC-yellow)](https://whispering-jealous-maize.glitch.me/btc.html) ![](https://cdn.glitch.global/1f2fe882-3c53-4eca-b8fe-de3ae4ea773a/720620852055638070.webp?v=1684342102785)

**Run windows 10 in your browser, for free**
Heavily, HEAVILY inspired by [this amazing site](https://www.aih.app/2023/02/04/run-windows-10-for-free-in-github-codespaces-using-qemu/). This is for the non-nerds.

## Table of Contents

[TOC]

## Installation
This guide will be in `x` pages
### Preparing
1. Visit [ngrok](https://dashboard.ngrok.com/get-started/setup) and make a account
2. Go to [this page](https://dashboard.ngrok.com/get-started/your-authtoken) and leave it open, we are gonna need it later on.
3. Install any VNC viewer. I personally like [RealVNC](https://www.realvnc.com/en/connect/download/viewer/) because its free. And uh, everyone likes free stuff.

### Making a codespace on GitHub
First, go to my [repository](https://github.com/DonDoesStuff/MyFreeCloudVM) and click on the green "Code" button.

![](https://lava.st/ht-cv.png)

Then, select "Codespaces" and click on the "+"

![](https://lava.st/wv5hj.png)

You will get redirected to your codespace

![](https://lava.st/gevs1.png)

### Setting up variables

Now, open `ngrok_key.txt`

![](https://lava.st/hsese.png)

And place your ngrok key you got at the beginning!

### Installing packages & iSO

Alright, on the terminal and type in `sh boot.sh` and click on the Enter key on your keyboard.

![](https://lava.st/5hyoe.png)

Then just select `1` on your keyboard and click Enter again. This will install everything automatically. So imma grab something to eat and ill be right back to help you once you are done installing.

Alright, you *should* get the message `Please read the Readme.md file for instructions on what to do next.` now. So uh, good job, you listened, I guess?
Anyways, this part is important. Open your [Codespaces](https://github.com/codespaces). Then, follow the steps shown in this handy dandy gif bellow:

![](https://cdn.discordapp.com/attachments/1107374742056480828/1108429862328336424/3qpb1zw.gif)

Alright, on the terminal (yes, again) and type in `sh boot.sh` and click on the Enter key on your keyboard. Then just select `1` on your keyboard and click Enter again. This time, installing will not take long

This time, you should see something like this:

![](https://lava.st/dnmqd.png)

Now, copy this value:

![](https://lava.st/ybs3b.png)

And remove the `tcp://` from it. Now, open your VNC, enter in the URL and click Enter.

![](https://lava.st/x6-n_.png)

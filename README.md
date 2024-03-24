<h2>REToolkit - Docker implementation of various reverse engineering toolkits</h2>
<h4>Base image : kalilinux/kali-rolling</h4>
<h4>Pre-built image : https://hub.docker.com/repository/docker/redsystems/retoolkit/general</h4>
<h4><u>Included :</u></h4>
<ul>
  <li><a href=https://github.com/angr/angr>Angr</a> - A powerful and user-friendly binary analysis platform</li>
  <li><a href=https://github.com/iBotPeaches/Apktool>Apktool</a> - A tool for reverse engineering Android apk files</li>
  <li><a href=https://github.com/gdabah/distorm>Distorm</a> - Powerful Disassembler Library For x86/AMD64</li>
  <li><a href=https://github.com/skylot/jadx>jadx</a> - Dex to Java decompiler</a></li>
  <li><a href=https://github.com/lief-project/LIEF>LIEF</a> - Library to Instrument Executable Formats</li>
  <li><a href=https://github.com/pwndbg/pwndbg>PwnDbg</a> - Exploit Development and Reverse Engineering with GDB Made Easy</li>
  <li><a href=https://github.com/Gallopsled/pwntools>Pwntools</a> - CTF framework and exploit development library</li>
  <li><a href=https://github.com/eliben/pyelftools>Pyelftools</a> - Parsing ELF and DWARF in Python</li>
  <li><a href=https://github.com/rizinorg/rizin>Rizin</a> - UNIX-like reverse engineering framework and command-line toolset</li>
  <li><a href=https://github.com/volatilityfoundation/volatility3>Volatility3</a> - The volatile memory extraction framework</li>
</ul>
<h4>Featured script overview</h4>
<ul>
  <li>There will be no networking in your container if you use the provided script</li>
  <li>Only place yourself in the desired folder, and its content will be mounted in the /sandbox/ location when executed</li>
  <li>Specify a directory or a file as an argument and it will be <strong><em>copied</em></strong> in /sandbox/ <strong><em>without being mapped</em></strong></li>
  <li><strong>Be careful</strong> : if launched with the provided script, <strong><u>the container and the sandbox volume are deleted when you exit the container</u></strong></li>
</ul>

  <h5>The Dockerfile is not necessary for the script to works. Only set the script retoolkit and add it script to your PATH</h5>

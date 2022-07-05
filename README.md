# Linux-GUI-Packages-Backup-Tool
<b>A little GUI made in bash + zenity, to bakup packages</b>


If zenity isn't installed you can do :


<figure> <pre> <code>sudo apt install zenity</code> </pre> </figure>


<h3>Note</h3>
This command will only work for Linux distributions that use APT (like Debian, Ubuntu, PopOS!, ...) <br></br>
You can read more about zenity here : https://doc.ubuntu-fr.org/zenity

<h2>IMPORTANT</h2>

<b>This script ignores missing packages (if you got a newer version of your distributions for example), so some packages can be missing in the end.</b>
Launch the script within a terminal to see the debug outpout.

 <br></br>
 
 <b>Also, if you're stuck in a loop try : </b><figure> <pre> <code>sudo dpkg --configure -a</code> </pre> </figure>
 
 Sometimes dpkg can be locked because of an error, and when it happens softwares can't be installed. This command is a way to resolve this problem.


<i>Dependencies : zenity, bash, echo, grep, dpkg, awk, xargs</i>

Licence : GNU General Public License 3.0

# Mips-CPU
CPU design and Generate Fibonacci Number<br>
Here is the simple CPU that the project is based on
![Image of cpu](https://github.com/qyyMriel/Mips-CPU/blob/master/src/mips_ss_v2_sch.gif)


##Description
* Fibonacci Number Generator by writing  Mips assempbly code based on simple CPU.
* Design the CPU by add components to implement Indexed, Auto Increment, Auto Decrement addressing modes to simple CPU.<br><br>
1.Indexed Addressing Mode <br>
                      +---------------------------+-------------------------+ <br>
                       | Indexed Addressing Mode  | [Rd] <- [Rd] + [Rs + Rt]  | <br>
                      +---------------------------+-------------------------+ <br>
The value to load is from data memory and the address of this data is the addition result of Rs and Rt<br><br>
2.Auto Increment Addressing Mode <br>
                   +----------------------------------+--------------------------------+ <br>
                   |  Auto Increment Addressing Mode  |  R1 <- R1 + M[R2], R2 <- R2 + 1   | <br>
                   +----------------------------------+--------------------------------+ <br>
Firstly, add the r1 with data memory output and the address of data memory output is from R2, then add 4 to R2 automatically.  <br><br>   
3.Auto Decrement Addressing Mode<br>
                       +--------------------------------------+-------------------------------+ <br>
                       |     Auto Decrement Addressing Mode   |  R2 <- R2 - 1, R1 <- R1 + M[R2]| <br>
                       +--------------------------------------+-------------------------------+ <br>
Firstly, decrease R2 by 4, then add the r1 with data memory output and the address of data memory output is [R2+4]<br>

# 3 Phase Permanent Magnet Synchronous Motor 
To start the study, a 3 phase PMSM is modeled, consolidating a solid base of knowledge for more complex machines in the future.

According to Fitzgerald, Arthur Eugene, Charles Kingsley, and Stephen D. Umans. "Electric machinery." (2003), it is possible to model the state equations of the synchronous machine by the following:

$$
\begin{align*}
v_d = R_ai_d + \frac{d\lambda_d}{dt} - \omega_{me}\lambda_q\\
v_q = R_ai_q + \frac{d\lambda_q}{dt} + \omega_{me}\lambda_d\\
J\frac{d\omega}{dt} = T_e - T_m - B_m\omega\\
\end{align*}
$$

where, 

$$
\begin{align*}
\omega_{me} =N\omega\\
N = \frac{poles}{2}\\
\lambda_d = L_di_d + L_{af}i_f\\
\lambda_q = L_qi_q\\
T_e  = \frac{3}{2}Ni_q\Psi_m\\
\end{align*}
$$

Neglecting $L_{af}i_f$ term, adding the back EMF to the $q$ axis and substituting the relations, it is possible to obtain

$$
\begin{align*}
v_d = R_ai_d + L_d\frac{di_d}{dt} - N\omega i_qL_q\\
v_q = R_ai_q + L_q\frac{di_q}{dt} + N\omega i_dL_d + \Psi_m N\omega\\
J\frac{d\omega}{dt} = T_e - T_m - B_m\omega\\
\end{align*}
$$

As it can be seen, the system is non-linear since it has a product of state variables: $i \times \omega$. To linearize the system using the small-signal models, the following manipulation needs to be done:

$$
\begin{align*}
(V̅_d + ṽ_d) = R_a(I̅_d + ĩ_d) + L_d\frac{d(I̅_d + ĩ_d)}{dt} - N(Ω̅ + ω̃ )(I̅_q + ĩ_q)L_q\\
(V̅_q + ṽ_q) = R_a(I̅_q + ĩ_q) + L_q\frac{d(I̅_q + ĩ_q)}{dt} - N(Ω̅ + ω̃ )(I̅_d + ĩ_d)L_d + \Psi_m N(Ω̅ + ω̃ )\\
\end{align*}
$$

Rearranging the terms:

$$
\begin{align*}
\frac{d(ĩ_d)}{dt} = -\frac{R_a}{L_d}ĩ_d + N\frac{L_q}{L_d}ĩ_qΩ̅  + Nω̃ I̅_q\frac{L_q}{L_d} + \frac{ṽ_d}{L_d}\\
\frac{d(ĩ_q)}{dt} = -\frac{R_a}{L_q}ĩ_q - N\frac{L_d}{L_q}ĩ_dΩ̅  - Nω̃ I̅_d\frac{L_d}{L_q} - \frac{\Psi_m}{L_q} Nω̃   + \frac{ṽ_q}{L_q}\\
\end{align*}
$$

Finally, the space-state matrix is established by

$$
\frac{d}{dt}\begin{bmatrix}
ĩ_d\\
ĩ_q\\
ω̃ 
\end{bmatrix} = 
\begin{bmatrix}
-\frac{R_a}{L_d} & N \frac{L_q}{L_d} \overline{\Omega} & N \overline{I_q} \frac{L_q}{L_d} \\
-N \frac{L_d}{L_q} \overline{\Omega} & -\frac{R_a}{L_q} & -\frac{N}{L_q}(\overline{I_d}L_d + \Psi_m) \\
0 & \frac{3N}{2J}\Psi_m & -\frac{B_m}{J}
\end{bmatrix}
\begin{bmatrix}
ĩ_d\\
ĩ_q\\
ω̃ 
\end{bmatrix} +
\begin{bmatrix}
\frac{1}{L_d} & 0 \\
0 & \frac{1}{L_q} \\
0 & 0
\end{bmatrix}
\begin{bmatrix}
ṽ_d\\
ṽ_q 
\end{bmatrix}
$$

$$
y =
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
ĩ_d\\
ĩ_q\\
ω̃ 
\end{bmatrix}
$$





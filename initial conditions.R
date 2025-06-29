
eror_cor<-4.8722e-4
alpha<-0.0000057761

# period t
#epsilon<- rep(6, n)
epsilon <- rep(0, n)  # create a vector of zeros
# assign 6 to the first entry
e<-rep(0.02, n)
epsilon[1430]<-100








x_t_minus1<-0.00491*((It_minus2)^0.3)*(U_t_minus2)^0.7+0.00245*((It_minus2)^0.3)*(V_t_minus2)^0.7 +0.0305*((It_minus1)^0.3)*(Rt_minus2)^0.7 -0.0204*W1%*%as.matrix(yt_minus2, ncol=1)


alpha_x_t_minus1<-x_t_minus1

x_t<-0.00491*((It_minus1)^0.3)*(U_t_minus1)^0.7+0.00245*((It_minus1)^0.3)*(V_t_minus1)^0.7 +0.0305*((It_minus1)^0.3)*(Rt_minus1)^0.7 -0.0204*W1%*%as.matrix(yt_minus1, ncol=1)

alpha_x_t<-x_t

alpha_z_t_minus1<-(1.3215e-5)*(V_t_minus3-V_t_minus4)+(12.323e-7)*yt_minus2+(48.607e-7)*yt_minus3-(5.583e-7)*W1%*% yt_minus2-(eror_cor)*log((pi_t_minus2/(1-pi_t_minus2)))+(0.9184e-9)*It_minus1*U_t_minus2 +(1.10977e-9)*(Rt_minus2-V_t_minus2)

alpha_z_t<-(1.3215e-5)*(V_t_minus2-V_t_minus3)+(12.323e-7)*yt_minus1+(48.607e-7)*yt_minus2-(5.583e-7)*(W1)%*% yt_minus1-(eror_cor)*log(pi_t_minus1/(1-pi_t_minus1))+(0.9184e-9)*It_minus1*U_t_minus1 +(1.10977e-9)*(Rt_minus1-V_t_minus1)

y_t<-A%*%(alpha_x_t-lambday*alpha_x_t_minus1+lambday*(Id-rho*W1)%*%yt_minus1+ epsilon)



little_vt_tilda<-Q%*%(alpha_z_t-lambdav*alpha_z_t_minus1+lambdav*(Id-r*W1)%*%little_v_tilda_tminus1 +e)
little_vt<-little_vt_tilda+0.8477*little_v_tilda_tminus1
min(little_vt)
#V_t
Vt=little_vt*pop + V_t_minus1

dim(little_vt)
dim(Vt)
Vt-V_t_minus1
# compute period t+1

It<-0.8*y_t+0.2*yt_minus1

U_t= pop-Vt


Rt<-Rt_minus1+0.2*yt_minus2

pi_t= Vt/pop




alpha_x_t_plus1= 0.00491*((It)^0.3)*(U_t)^0.7+0.00245*((It)^0.3)*(Vt)^0.7 +0.0305*((It)^0.3)*(Rt)^0.7 -0.0204*W1%*%as.matrix(y_t, ncol=1)


y_t_plus1<-A%*%(alpha_x_t_plus1-lambday*alpha_x_t+lambday*(Id-rho*W1)%*%y_t)


alpha_z_t_plus1<-(1.3215e-5)*(V_t_minus1-V_t_minus2)+(12.323e-7)*y_t+(48.607e-7)*yt_minus1-(5.583e-7)*(W1)%*% y_t-(eror_cor)*log((pi_t/(1-pi_t)))+(0.9184e-9)*It*U_t +(1.10977e-9)*(Rt-Vt)

little_vt_tilda_plus1<-Q%*%(alpha_z_t_plus1-lambdav*alpha_z_t+lambdav*(Id-r*W1)%*%little_vt_tilda )

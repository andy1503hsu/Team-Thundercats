��
��
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( �
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype�
E
Relu
features"T
activations"T"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ��
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.9.12v2.9.0-18-gd8ce9f9c3018��
�
!Adam/MOR_and_LWC_estimates/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Adam/MOR_and_LWC_estimates/bias/v
�
5Adam/MOR_and_LWC_estimates/bias/v/Read/ReadVariableOpReadVariableOp!Adam/MOR_and_LWC_estimates/bias/v*
_output_shapes
:*
dtype0
�
#Adam/MOR_and_LWC_estimates/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*4
shared_name%#Adam/MOR_and_LWC_estimates/kernel/v
�
7Adam/MOR_and_LWC_estimates/kernel/v/Read/ReadVariableOpReadVariableOp#Adam/MOR_and_LWC_estimates/kernel/v*
_output_shapes

:*
dtype0
�
Adam/Third_Dense_Layer/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_nameAdam/Third_Dense_Layer/bias/v
�
1Adam/Third_Dense_Layer/bias/v/Read/ReadVariableOpReadVariableOpAdam/Third_Dense_Layer/bias/v*
_output_shapes
:*
dtype0
�
Adam/Third_Dense_Layer/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *0
shared_name!Adam/Third_Dense_Layer/kernel/v
�
3Adam/Third_Dense_Layer/kernel/v/Read/ReadVariableOpReadVariableOpAdam/Third_Dense_Layer/kernel/v*
_output_shapes

: *
dtype0
�
Adam/Second_Dense_Layer/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: */
shared_name Adam/Second_Dense_Layer/bias/v
�
2Adam/Second_Dense_Layer/bias/v/Read/ReadVariableOpReadVariableOpAdam/Second_Dense_Layer/bias/v*
_output_shapes
: *
dtype0
�
 Adam/Second_Dense_Layer/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@ *1
shared_name" Adam/Second_Dense_Layer/kernel/v
�
4Adam/Second_Dense_Layer/kernel/v/Read/ReadVariableOpReadVariableOp Adam/Second_Dense_Layer/kernel/v*
_output_shapes

:@ *
dtype0
�
Adam/First_Dense_Layer/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*.
shared_nameAdam/First_Dense_Layer/bias/v
�
1Adam/First_Dense_Layer/bias/v/Read/ReadVariableOpReadVariableOpAdam/First_Dense_Layer/bias/v*
_output_shapes
:@*
dtype0
�
Adam/First_Dense_Layer/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:`@*0
shared_name!Adam/First_Dense_Layer/kernel/v
�
3Adam/First_Dense_Layer/kernel/v/Read/ReadVariableOpReadVariableOpAdam/First_Dense_Layer/kernel/v*
_output_shapes

:`@*
dtype0
�
Adam/Lidar_Dense_Layer/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *.
shared_nameAdam/Lidar_Dense_Layer/bias/v
�
1Adam/Lidar_Dense_Layer/bias/v/Read/ReadVariableOpReadVariableOpAdam/Lidar_Dense_Layer/bias/v*
_output_shapes
: *
dtype0
�
Adam/Lidar_Dense_Layer/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� *0
shared_name!Adam/Lidar_Dense_Layer/kernel/v
�
3Adam/Lidar_Dense_Layer/kernel/v/Read/ReadVariableOpReadVariableOpAdam/Lidar_Dense_Layer/kernel/v*
_output_shapes
:	� *
dtype0
�
 Adam/Infrared_Dense_Layer/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *1
shared_name" Adam/Infrared_Dense_Layer/bias/v
�
4Adam/Infrared_Dense_Layer/bias/v/Read/ReadVariableOpReadVariableOp Adam/Infrared_Dense_Layer/bias/v*
_output_shapes
: *
dtype0
�
"Adam/Infrared_Dense_Layer/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� *3
shared_name$"Adam/Infrared_Dense_Layer/kernel/v
�
6Adam/Infrared_Dense_Layer/kernel/v/Read/ReadVariableOpReadVariableOp"Adam/Infrared_Dense_Layer/kernel/v*
_output_shapes
:	� *
dtype0
�
Adam/Visible_Dense_Layer/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *0
shared_name!Adam/Visible_Dense_Layer/bias/v
�
3Adam/Visible_Dense_Layer/bias/v/Read/ReadVariableOpReadVariableOpAdam/Visible_Dense_Layer/bias/v*
_output_shapes
: *
dtype0
�
!Adam/Visible_Dense_Layer/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� *2
shared_name#!Adam/Visible_Dense_Layer/kernel/v
�
5Adam/Visible_Dense_Layer/kernel/v/Read/ReadVariableOpReadVariableOp!Adam/Visible_Dense_Layer/kernel/v*
_output_shapes
:	� *
dtype0
�
!Adam/MOR_and_LWC_estimates/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!Adam/MOR_and_LWC_estimates/bias/m
�
5Adam/MOR_and_LWC_estimates/bias/m/Read/ReadVariableOpReadVariableOp!Adam/MOR_and_LWC_estimates/bias/m*
_output_shapes
:*
dtype0
�
#Adam/MOR_and_LWC_estimates/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*4
shared_name%#Adam/MOR_and_LWC_estimates/kernel/m
�
7Adam/MOR_and_LWC_estimates/kernel/m/Read/ReadVariableOpReadVariableOp#Adam/MOR_and_LWC_estimates/kernel/m*
_output_shapes

:*
dtype0
�
Adam/Third_Dense_Layer/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_nameAdam/Third_Dense_Layer/bias/m
�
1Adam/Third_Dense_Layer/bias/m/Read/ReadVariableOpReadVariableOpAdam/Third_Dense_Layer/bias/m*
_output_shapes
:*
dtype0
�
Adam/Third_Dense_Layer/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *0
shared_name!Adam/Third_Dense_Layer/kernel/m
�
3Adam/Third_Dense_Layer/kernel/m/Read/ReadVariableOpReadVariableOpAdam/Third_Dense_Layer/kernel/m*
_output_shapes

: *
dtype0
�
Adam/Second_Dense_Layer/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: */
shared_name Adam/Second_Dense_Layer/bias/m
�
2Adam/Second_Dense_Layer/bias/m/Read/ReadVariableOpReadVariableOpAdam/Second_Dense_Layer/bias/m*
_output_shapes
: *
dtype0
�
 Adam/Second_Dense_Layer/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@ *1
shared_name" Adam/Second_Dense_Layer/kernel/m
�
4Adam/Second_Dense_Layer/kernel/m/Read/ReadVariableOpReadVariableOp Adam/Second_Dense_Layer/kernel/m*
_output_shapes

:@ *
dtype0
�
Adam/First_Dense_Layer/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*.
shared_nameAdam/First_Dense_Layer/bias/m
�
1Adam/First_Dense_Layer/bias/m/Read/ReadVariableOpReadVariableOpAdam/First_Dense_Layer/bias/m*
_output_shapes
:@*
dtype0
�
Adam/First_Dense_Layer/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:`@*0
shared_name!Adam/First_Dense_Layer/kernel/m
�
3Adam/First_Dense_Layer/kernel/m/Read/ReadVariableOpReadVariableOpAdam/First_Dense_Layer/kernel/m*
_output_shapes

:`@*
dtype0
�
Adam/Lidar_Dense_Layer/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *.
shared_nameAdam/Lidar_Dense_Layer/bias/m
�
1Adam/Lidar_Dense_Layer/bias/m/Read/ReadVariableOpReadVariableOpAdam/Lidar_Dense_Layer/bias/m*
_output_shapes
: *
dtype0
�
Adam/Lidar_Dense_Layer/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� *0
shared_name!Adam/Lidar_Dense_Layer/kernel/m
�
3Adam/Lidar_Dense_Layer/kernel/m/Read/ReadVariableOpReadVariableOpAdam/Lidar_Dense_Layer/kernel/m*
_output_shapes
:	� *
dtype0
�
 Adam/Infrared_Dense_Layer/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *1
shared_name" Adam/Infrared_Dense_Layer/bias/m
�
4Adam/Infrared_Dense_Layer/bias/m/Read/ReadVariableOpReadVariableOp Adam/Infrared_Dense_Layer/bias/m*
_output_shapes
: *
dtype0
�
"Adam/Infrared_Dense_Layer/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� *3
shared_name$"Adam/Infrared_Dense_Layer/kernel/m
�
6Adam/Infrared_Dense_Layer/kernel/m/Read/ReadVariableOpReadVariableOp"Adam/Infrared_Dense_Layer/kernel/m*
_output_shapes
:	� *
dtype0
�
Adam/Visible_Dense_Layer/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *0
shared_name!Adam/Visible_Dense_Layer/bias/m
�
3Adam/Visible_Dense_Layer/bias/m/Read/ReadVariableOpReadVariableOpAdam/Visible_Dense_Layer/bias/m*
_output_shapes
: *
dtype0
�
!Adam/Visible_Dense_Layer/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� *2
shared_name#!Adam/Visible_Dense_Layer/kernel/m
�
5Adam/Visible_Dense_Layer/kernel/m/Read/ReadVariableOpReadVariableOp!Adam/Visible_Dense_Layer/kernel/m*
_output_shapes
:	� *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
�
MOR_and_LWC_estimates/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameMOR_and_LWC_estimates/bias
�
.MOR_and_LWC_estimates/bias/Read/ReadVariableOpReadVariableOpMOR_and_LWC_estimates/bias*
_output_shapes
:*
dtype0
�
MOR_and_LWC_estimates/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*-
shared_nameMOR_and_LWC_estimates/kernel
�
0MOR_and_LWC_estimates/kernel/Read/ReadVariableOpReadVariableOpMOR_and_LWC_estimates/kernel*
_output_shapes

:*
dtype0
�
Third_Dense_Layer/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameThird_Dense_Layer/bias
}
*Third_Dense_Layer/bias/Read/ReadVariableOpReadVariableOpThird_Dense_Layer/bias*
_output_shapes
:*
dtype0
�
Third_Dense_Layer/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *)
shared_nameThird_Dense_Layer/kernel
�
,Third_Dense_Layer/kernel/Read/ReadVariableOpReadVariableOpThird_Dense_Layer/kernel*
_output_shapes

: *
dtype0
�
Second_Dense_Layer/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *(
shared_nameSecond_Dense_Layer/bias

+Second_Dense_Layer/bias/Read/ReadVariableOpReadVariableOpSecond_Dense_Layer/bias*
_output_shapes
: *
dtype0
�
Second_Dense_Layer/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@ **
shared_nameSecond_Dense_Layer/kernel
�
-Second_Dense_Layer/kernel/Read/ReadVariableOpReadVariableOpSecond_Dense_Layer/kernel*
_output_shapes

:@ *
dtype0
�
First_Dense_Layer/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*'
shared_nameFirst_Dense_Layer/bias
}
*First_Dense_Layer/bias/Read/ReadVariableOpReadVariableOpFirst_Dense_Layer/bias*
_output_shapes
:@*
dtype0
�
First_Dense_Layer/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:`@*)
shared_nameFirst_Dense_Layer/kernel
�
,First_Dense_Layer/kernel/Read/ReadVariableOpReadVariableOpFirst_Dense_Layer/kernel*
_output_shapes

:`@*
dtype0
�
Lidar_Dense_Layer/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *'
shared_nameLidar_Dense_Layer/bias
}
*Lidar_Dense_Layer/bias/Read/ReadVariableOpReadVariableOpLidar_Dense_Layer/bias*
_output_shapes
: *
dtype0
�
Lidar_Dense_Layer/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� *)
shared_nameLidar_Dense_Layer/kernel
�
,Lidar_Dense_Layer/kernel/Read/ReadVariableOpReadVariableOpLidar_Dense_Layer/kernel*
_output_shapes
:	� *
dtype0
�
Infrared_Dense_Layer/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: **
shared_nameInfrared_Dense_Layer/bias
�
-Infrared_Dense_Layer/bias/Read/ReadVariableOpReadVariableOpInfrared_Dense_Layer/bias*
_output_shapes
: *
dtype0
�
Infrared_Dense_Layer/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� *,
shared_nameInfrared_Dense_Layer/kernel
�
/Infrared_Dense_Layer/kernel/Read/ReadVariableOpReadVariableOpInfrared_Dense_Layer/kernel*
_output_shapes
:	� *
dtype0
�
Visible_Dense_Layer/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *)
shared_nameVisible_Dense_Layer/bias
�
,Visible_Dense_Layer/bias/Read/ReadVariableOpReadVariableOpVisible_Dense_Layer/bias*
_output_shapes
: *
dtype0
�
Visible_Dense_Layer/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� *+
shared_nameVisible_Dense_Layer/kernel
�
.Visible_Dense_Layer/kernel/Read/ReadVariableOpReadVariableOpVisible_Dense_Layer/kernel*
_output_shapes
:	� *
dtype0

NoOpNoOp
�p
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�o
value�oB�o B�o
�
layer-0
layer-1
layer-2
layer-3
layer-4
layer-5
layer-6
layer-7
	layer-8

layer-9
layer-10
layer_with_weights-0
layer-11
layer_with_weights-1
layer-12
layer_with_weights-2
layer-13
layer-14
layer_with_weights-3
layer-15
layer_with_weights-4
layer-16
layer_with_weights-5
layer-17
layer_with_weights-6
layer-18
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures*
* 
* 
* 
* 
* 
* 
* 
* 
�
	variables
trainable_variables
regularization_losses
 	keras_api
!__call__
*"&call_and_return_all_conditional_losses* 
�
#	variables
$trainable_variables
%regularization_losses
&	keras_api
'__call__
*(&call_and_return_all_conditional_losses* 
�
)	variables
*trainable_variables
+regularization_losses
,	keras_api
-__call__
*.&call_and_return_all_conditional_losses* 
�
/	variables
0trainable_variables
1regularization_losses
2	keras_api
3__call__
*4&call_and_return_all_conditional_losses

5kernel
6bias*
�
7	variables
8trainable_variables
9regularization_losses
:	keras_api
;__call__
*<&call_and_return_all_conditional_losses

=kernel
>bias*
�
?	variables
@trainable_variables
Aregularization_losses
B	keras_api
C__call__
*D&call_and_return_all_conditional_losses

Ekernel
Fbias*
�
G	variables
Htrainable_variables
Iregularization_losses
J	keras_api
K__call__
*L&call_and_return_all_conditional_losses* 
�
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
Q__call__
*R&call_and_return_all_conditional_losses

Skernel
Tbias*
�
U	variables
Vtrainable_variables
Wregularization_losses
X	keras_api
Y__call__
*Z&call_and_return_all_conditional_losses

[kernel
\bias*
�
]	variables
^trainable_variables
_regularization_losses
`	keras_api
a__call__
*b&call_and_return_all_conditional_losses

ckernel
dbias*
�
e	variables
ftrainable_variables
gregularization_losses
h	keras_api
i__call__
*j&call_and_return_all_conditional_losses

kkernel
lbias*
j
50
61
=2
>3
E4
F5
S6
T7
[8
\9
c10
d11
k12
l13*
j
50
61
=2
>3
E4
F5
S6
T7
[8
\9
c10
d11
k12
l13*
* 
�
mnon_trainable_variables

nlayers
ometrics
player_regularization_losses
qlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
6
rtrace_0
strace_1
ttrace_2
utrace_3* 
6
vtrace_0
wtrace_1
xtrace_2
ytrace_3* 
* 
�
ziter

{beta_1

|beta_2
	}decay
~learning_rate5m�6m�=m�>m�Em�Fm�Sm�Tm�[m�\m�cm�dm�km�lm�5v�6v�=v�>v�Ev�Fv�Sv�Tv�[v�\v�cv�dv�kv�lv�*

serving_default* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
!__call__
*"&call_and_return_all_conditional_losses
&""call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
#	variables
$trainable_variables
%regularization_losses
'__call__
*(&call_and_return_all_conditional_losses
&("call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
)	variables
*trainable_variables
+regularization_losses
-__call__
*.&call_and_return_all_conditional_losses
&."call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

50
61*

50
61*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
/	variables
0trainable_variables
1regularization_losses
3__call__
*4&call_and_return_all_conditional_losses
&4"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
jd
VARIABLE_VALUEVisible_Dense_Layer/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
f`
VARIABLE_VALUEVisible_Dense_Layer/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE*

=0
>1*

=0
>1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
7	variables
8trainable_variables
9regularization_losses
;__call__
*<&call_and_return_all_conditional_losses
&<"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
ke
VARIABLE_VALUEInfrared_Dense_Layer/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEInfrared_Dense_Layer/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*

E0
F1*

E0
F1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
?	variables
@trainable_variables
Aregularization_losses
C__call__
*D&call_and_return_all_conditional_losses
&D"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
hb
VARIABLE_VALUELidar_Dense_Layer/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
d^
VARIABLE_VALUELidar_Dense_Layer/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
G	variables
Htrainable_variables
Iregularization_losses
K__call__
*L&call_and_return_all_conditional_losses
&L"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

S0
T1*

S0
T1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
M	variables
Ntrainable_variables
Oregularization_losses
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
hb
VARIABLE_VALUEFirst_Dense_Layer/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE*
d^
VARIABLE_VALUEFirst_Dense_Layer/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE*

[0
\1*

[0
\1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
U	variables
Vtrainable_variables
Wregularization_losses
Y__call__
*Z&call_and_return_all_conditional_losses
&Z"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
ic
VARIABLE_VALUESecond_Dense_Layer/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUESecond_Dense_Layer/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE*

c0
d1*

c0
d1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
]	variables
^trainable_variables
_regularization_losses
a__call__
*b&call_and_return_all_conditional_losses
&b"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
hb
VARIABLE_VALUEThird_Dense_Layer/kernel6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUE*
d^
VARIABLE_VALUEThird_Dense_Layer/bias4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUE*

k0
l1*

k0
l1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
e	variables
ftrainable_variables
gregularization_losses
i__call__
*j&call_and_return_all_conditional_losses
&j"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
lf
VARIABLE_VALUEMOR_and_LWC_estimates/kernel6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUEMOR_and_LWC_estimates/bias4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
�
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15
16
17
18*

�0
�1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
LF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
<
�	variables
�	keras_api

�total

�count*
M
�	variables
�	keras_api

�total

�count
�
_fn_kwargs*

�0
�1*

�	variables*
UO
VARIABLE_VALUEtotal_14keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_14keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

�0
�1*

�	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE*
* 
��
VARIABLE_VALUE!Adam/Visible_Dense_Layer/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/Visible_Dense_Layer/bias/mPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUE"Adam/Infrared_Dense_Layer/kernel/mRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUE Adam/Infrared_Dense_Layer/bias/mPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/Lidar_Dense_Layer/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/Lidar_Dense_Layer/bias/mPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/First_Dense_Layer/kernel/mRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/First_Dense_Layer/bias/mPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUE Adam/Second_Dense_Layer/kernel/mRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/Second_Dense_Layer/bias/mPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/Third_Dense_Layer/kernel/mRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/Third_Dense_Layer/bias/mPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUE#Adam/MOR_and_LWC_estimates/kernel/mRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUE!Adam/MOR_and_LWC_estimates/bias/mPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUE!Adam/Visible_Dense_Layer/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/Visible_Dense_Layer/bias/vPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUE"Adam/Infrared_Dense_Layer/kernel/vRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUE Adam/Infrared_Dense_Layer/bias/vPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/Lidar_Dense_Layer/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/Lidar_Dense_Layer/bias/vPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/First_Dense_Layer/kernel/vRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/First_Dense_Layer/bias/vPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUE Adam/Second_Dense_Layer/kernel/vRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/Second_Dense_Layer/bias/vPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/Third_Dense_Layer/kernel/vRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/Third_Dense_Layer/bias/vPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUE#Adam/MOR_and_LWC_estimates/kernel/vRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUE!Adam/MOR_and_LWC_estimates/bias/vPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
�
+serving_default_Infrared_Laplacian_VariancePlaceholder*'
_output_shapes
:���������*
dtype0*
shape:���������
�
)serving_default_Infrared_Power_Spectrum_XPlaceholder*(
_output_shapes
:����������*
dtype0*
shape:����������
�
)serving_default_Infrared_Power_Spectrum_YPlaceholder*(
_output_shapes
:����������*
dtype0*
shape:����������
�
serving_default_Lidar_Depth_MapPlaceholder*(
_output_shapes
:����������*
dtype0*
shape:����������
�
'serving_default_Lidar_Ping_DistributionPlaceholder*'
_output_shapes
:���������d*
dtype0*
shape:���������d
�
*serving_default_Visible_Laplacian_VariancePlaceholder*'
_output_shapes
:���������*
dtype0*
shape:���������
�
(serving_default_Visible_Power_Spectrum_XPlaceholder*(
_output_shapes
:����������*
dtype0*
shape:����������
�
(serving_default_Visible_Power_Spectrum_YPlaceholder*(
_output_shapes
:����������*
dtype0*
shape:����������
�
StatefulPartitionedCallStatefulPartitionedCall+serving_default_Infrared_Laplacian_Variance)serving_default_Infrared_Power_Spectrum_X)serving_default_Infrared_Power_Spectrum_Yserving_default_Lidar_Depth_Map'serving_default_Lidar_Ping_Distribution*serving_default_Visible_Laplacian_Variance(serving_default_Visible_Power_Spectrum_X(serving_default_Visible_Power_Spectrum_YVisible_Dense_Layer/kernelVisible_Dense_Layer/biasInfrared_Dense_Layer/kernelInfrared_Dense_Layer/biasLidar_Dense_Layer/kernelLidar_Dense_Layer/biasFirst_Dense_Layer/kernelFirst_Dense_Layer/biasSecond_Dense_Layer/kernelSecond_Dense_Layer/biasThird_Dense_Layer/kernelThird_Dense_Layer/biasMOR_and_LWC_estimates/kernelMOR_and_LWC_estimates/bias*!
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *+
f&R$
"__inference_signature_wrapper_5586
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename.Visible_Dense_Layer/kernel/Read/ReadVariableOp,Visible_Dense_Layer/bias/Read/ReadVariableOp/Infrared_Dense_Layer/kernel/Read/ReadVariableOp-Infrared_Dense_Layer/bias/Read/ReadVariableOp,Lidar_Dense_Layer/kernel/Read/ReadVariableOp*Lidar_Dense_Layer/bias/Read/ReadVariableOp,First_Dense_Layer/kernel/Read/ReadVariableOp*First_Dense_Layer/bias/Read/ReadVariableOp-Second_Dense_Layer/kernel/Read/ReadVariableOp+Second_Dense_Layer/bias/Read/ReadVariableOp,Third_Dense_Layer/kernel/Read/ReadVariableOp*Third_Dense_Layer/bias/Read/ReadVariableOp0MOR_and_LWC_estimates/kernel/Read/ReadVariableOp.MOR_and_LWC_estimates/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp5Adam/Visible_Dense_Layer/kernel/m/Read/ReadVariableOp3Adam/Visible_Dense_Layer/bias/m/Read/ReadVariableOp6Adam/Infrared_Dense_Layer/kernel/m/Read/ReadVariableOp4Adam/Infrared_Dense_Layer/bias/m/Read/ReadVariableOp3Adam/Lidar_Dense_Layer/kernel/m/Read/ReadVariableOp1Adam/Lidar_Dense_Layer/bias/m/Read/ReadVariableOp3Adam/First_Dense_Layer/kernel/m/Read/ReadVariableOp1Adam/First_Dense_Layer/bias/m/Read/ReadVariableOp4Adam/Second_Dense_Layer/kernel/m/Read/ReadVariableOp2Adam/Second_Dense_Layer/bias/m/Read/ReadVariableOp3Adam/Third_Dense_Layer/kernel/m/Read/ReadVariableOp1Adam/Third_Dense_Layer/bias/m/Read/ReadVariableOp7Adam/MOR_and_LWC_estimates/kernel/m/Read/ReadVariableOp5Adam/MOR_and_LWC_estimates/bias/m/Read/ReadVariableOp5Adam/Visible_Dense_Layer/kernel/v/Read/ReadVariableOp3Adam/Visible_Dense_Layer/bias/v/Read/ReadVariableOp6Adam/Infrared_Dense_Layer/kernel/v/Read/ReadVariableOp4Adam/Infrared_Dense_Layer/bias/v/Read/ReadVariableOp3Adam/Lidar_Dense_Layer/kernel/v/Read/ReadVariableOp1Adam/Lidar_Dense_Layer/bias/v/Read/ReadVariableOp3Adam/First_Dense_Layer/kernel/v/Read/ReadVariableOp1Adam/First_Dense_Layer/bias/v/Read/ReadVariableOp4Adam/Second_Dense_Layer/kernel/v/Read/ReadVariableOp2Adam/Second_Dense_Layer/bias/v/Read/ReadVariableOp3Adam/Third_Dense_Layer/kernel/v/Read/ReadVariableOp1Adam/Third_Dense_Layer/bias/v/Read/ReadVariableOp7Adam/MOR_and_LWC_estimates/kernel/v/Read/ReadVariableOp5Adam/MOR_and_LWC_estimates/bias/v/Read/ReadVariableOpConst*@
Tin9
725	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *&
f!R
__inference__traced_save_6183
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameVisible_Dense_Layer/kernelVisible_Dense_Layer/biasInfrared_Dense_Layer/kernelInfrared_Dense_Layer/biasLidar_Dense_Layer/kernelLidar_Dense_Layer/biasFirst_Dense_Layer/kernelFirst_Dense_Layer/biasSecond_Dense_Layer/kernelSecond_Dense_Layer/biasThird_Dense_Layer/kernelThird_Dense_Layer/biasMOR_and_LWC_estimates/kernelMOR_and_LWC_estimates/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotal_1count_1totalcount!Adam/Visible_Dense_Layer/kernel/mAdam/Visible_Dense_Layer/bias/m"Adam/Infrared_Dense_Layer/kernel/m Adam/Infrared_Dense_Layer/bias/mAdam/Lidar_Dense_Layer/kernel/mAdam/Lidar_Dense_Layer/bias/mAdam/First_Dense_Layer/kernel/mAdam/First_Dense_Layer/bias/m Adam/Second_Dense_Layer/kernel/mAdam/Second_Dense_Layer/bias/mAdam/Third_Dense_Layer/kernel/mAdam/Third_Dense_Layer/bias/m#Adam/MOR_and_LWC_estimates/kernel/m!Adam/MOR_and_LWC_estimates/bias/m!Adam/Visible_Dense_Layer/kernel/vAdam/Visible_Dense_Layer/bias/v"Adam/Infrared_Dense_Layer/kernel/v Adam/Infrared_Dense_Layer/bias/vAdam/Lidar_Dense_Layer/kernel/vAdam/Lidar_Dense_Layer/bias/vAdam/First_Dense_Layer/kernel/vAdam/First_Dense_Layer/bias/v Adam/Second_Dense_Layer/kernel/vAdam/Second_Dense_Layer/bias/vAdam/Third_Dense_Layer/kernel/vAdam/Third_Dense_Layer/bias/v#Adam/MOR_and_LWC_estimates/kernel/v!Adam/MOR_and_LWC_estimates/bias/v*?
Tin8
624*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *)
f$R"
 __inference__traced_restore_6346��	
�

�
K__inference_Third_Dense_Layer_layer_call_and_return_conditional_losses_5112

inputs0
matmul_readvariableop_resource: -
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:���������Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:��������� : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:��������� 
 
_user_specified_nameinputs
�
�
$__inference_model_layer_call_fn_5626
inputs_0
inputs_1
inputs_2
inputs_3
inputs_4
inputs_5
inputs_6
inputs_7
unknown:	� 
	unknown_0: 
	unknown_1:	� 
	unknown_2: 
	unknown_3:	� 
	unknown_4: 
	unknown_5:`@
	unknown_6:@
	unknown_7:@ 
	unknown_8: 
	unknown_9: 

unknown_10:

unknown_11:

unknown_12:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1inputs_2inputs_3inputs_4inputs_5inputs_6inputs_7unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*!
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *H
fCRA
?__inference_model_layer_call_and_return_conditional_losses_5136o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������:����������:����������:���������:����������:����������:���������d:����������: : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/1:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/2:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/3:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/4:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/5:QM
'
_output_shapes
:���������d
"
_user_specified_name
inputs/6:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/7
�

�
K__inference_First_Dense_Layer_layer_call_and_return_conditional_losses_5078

inputs0
matmul_readvariableop_resource:`@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:`@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:���������@Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������@w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������`: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������`
 
_user_specified_nameinputs
�
�
J__inference_Combined_Visible_layer_call_and_return_conditional_losses_5817
inputs_0
inputs_1
inputs_2
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
concatConcatV2inputs_0inputs_1inputs_2concat/axis:output:0*
N*
T0*(
_output_shapes
:����������X
IdentityIdentityconcat:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:���������:����������:����������:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/1:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/2
�
r
H__inference_Combined_Lidar_layer_call_and_return_conditional_losses_4984

inputs
inputs_1
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :v
concatConcatV2inputsinputs_1concat/axis:output:0*
N*
T0*(
_output_shapes
:����������X
IdentityIdentityconcat:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������d:����������:O K
'
_output_shapes
:���������d
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
L__inference_Second_Dense_Layer_layer_call_and_return_conditional_losses_5095

inputs0
matmul_readvariableop_resource:@ -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@ *
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:��������� Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:��������� w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
$__inference_model_layer_call_fn_5167
visible_laplacian_variance
visible_power_spectrum_x
visible_power_spectrum_y
infrared_laplacian_variance
infrared_power_spectrum_x
infrared_power_spectrum_y
lidar_ping_distribution
lidar_depth_map
unknown:	� 
	unknown_0: 
	unknown_1:	� 
	unknown_2: 
	unknown_3:	� 
	unknown_4: 
	unknown_5:`@
	unknown_6:@
	unknown_7:@ 
	unknown_8: 
	unknown_9: 

unknown_10:

unknown_11:

unknown_12:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallvisible_laplacian_variancevisible_power_spectrum_xvisible_power_spectrum_yinfrared_laplacian_varianceinfrared_power_spectrum_xinfrared_power_spectrum_ylidar_ping_distributionlidar_depth_mapunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*!
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *H
fCRA
?__inference_model_layer_call_and_return_conditional_losses_5136o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������:����������:����������:���������:����������:����������:���������d:����������: : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:c _
'
_output_shapes
:���������
4
_user_specified_nameVisible_Laplacian_Variance:b^
(
_output_shapes
:����������
2
_user_specified_nameVisible_Power_Spectrum_X:b^
(
_output_shapes
:����������
2
_user_specified_nameVisible_Power_Spectrum_Y:d`
'
_output_shapes
:���������
5
_user_specified_nameInfrared_Laplacian_Variance:c_
(
_output_shapes
:����������
3
_user_specified_nameInfrared_Power_Spectrum_X:c_
(
_output_shapes
:����������
3
_user_specified_nameInfrared_Power_Spectrum_Y:`\
'
_output_shapes
:���������d
1
_user_specified_nameLidar_Ping_Distribution:YU
(
_output_shapes
:����������
)
_user_specified_nameLidar_Depth_Map
�
�
K__inference_Combined_Infrared_layer_call_and_return_conditional_losses_4994

inputs
inputs_1
inputs_2
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
concatConcatV2inputsinputs_1inputs_2concat/axis:output:0*
N*
T0*(
_output_shapes
:����������X
IdentityIdentityconcat:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:���������:����������:����������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs
�=
�
?__inference_model_layer_call_and_return_conditional_losses_5367

inputs
inputs_1
inputs_2
inputs_3
inputs_4
inputs_5
inputs_6
inputs_7+
visible_dense_layer_5330:	� &
visible_dense_layer_5332: ,
infrared_dense_layer_5335:	� '
infrared_dense_layer_5337: )
lidar_dense_layer_5340:	� $
lidar_dense_layer_5342: (
first_dense_layer_5346:`@$
first_dense_layer_5348:@)
second_dense_layer_5351:@ %
second_dense_layer_5353: (
third_dense_layer_5356: $
third_dense_layer_5358:,
mor_and_lwc_estimates_5361:(
mor_and_lwc_estimates_5363:
identity��)First_Dense_Layer/StatefulPartitionedCall�,Infrared_Dense_Layer/StatefulPartitionedCall�)Lidar_Dense_Layer/StatefulPartitionedCall�-MOR_and_LWC_estimates/StatefulPartitionedCall�*Second_Dense_Layer/StatefulPartitionedCall�)Third_Dense_Layer/StatefulPartitionedCall�+Visible_Dense_Layer/StatefulPartitionedCall�
Combined_Lidar/PartitionedCallPartitionedCallinputs_6inputs_7*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *Q
fLRJ
H__inference_Combined_Lidar_layer_call_and_return_conditional_losses_4984�
!Combined_Infrared/PartitionedCallPartitionedCallinputs_3inputs_4inputs_5*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Combined_Infrared_layer_call_and_return_conditional_losses_4994�
 Combined_Visible/PartitionedCallPartitionedCallinputsinputs_1inputs_2*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_Combined_Visible_layer_call_and_return_conditional_losses_5004�
+Visible_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall)Combined_Visible/PartitionedCall:output:0visible_dense_layer_5330visible_dense_layer_5332*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_Visible_Dense_Layer_layer_call_and_return_conditional_losses_5017�
,Infrared_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall*Combined_Infrared/PartitionedCall:output:0infrared_dense_layer_5335infrared_dense_layer_5337*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_Infrared_Dense_Layer_layer_call_and_return_conditional_losses_5034�
)Lidar_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall'Combined_Lidar/PartitionedCall:output:0lidar_dense_layer_5340lidar_dense_layer_5342*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Lidar_Dense_Layer_layer_call_and_return_conditional_losses_5051�
 Combined_Neurons/PartitionedCallPartitionedCall4Visible_Dense_Layer/StatefulPartitionedCall:output:05Infrared_Dense_Layer/StatefulPartitionedCall:output:02Lidar_Dense_Layer/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������`* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_Combined_Neurons_layer_call_and_return_conditional_losses_5065�
)First_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall)Combined_Neurons/PartitionedCall:output:0first_dense_layer_5346first_dense_layer_5348*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_First_Dense_Layer_layer_call_and_return_conditional_losses_5078�
*Second_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall2First_Dense_Layer/StatefulPartitionedCall:output:0second_dense_layer_5351second_dense_layer_5353*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_Second_Dense_Layer_layer_call_and_return_conditional_losses_5095�
)Third_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall3Second_Dense_Layer/StatefulPartitionedCall:output:0third_dense_layer_5356third_dense_layer_5358*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Third_Dense_Layer_layer_call_and_return_conditional_losses_5112�
-MOR_and_LWC_estimates/StatefulPartitionedCallStatefulPartitionedCall2Third_Dense_Layer/StatefulPartitionedCall:output:0mor_and_lwc_estimates_5361mor_and_lwc_estimates_5363*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_MOR_and_LWC_estimates_layer_call_and_return_conditional_losses_5129�
IdentityIdentity6MOR_and_LWC_estimates/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp*^First_Dense_Layer/StatefulPartitionedCall-^Infrared_Dense_Layer/StatefulPartitionedCall*^Lidar_Dense_Layer/StatefulPartitionedCall.^MOR_and_LWC_estimates/StatefulPartitionedCall+^Second_Dense_Layer/StatefulPartitionedCall*^Third_Dense_Layer/StatefulPartitionedCall,^Visible_Dense_Layer/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������:����������:����������:���������:����������:����������:���������d:����������: : : : : : : : : : : : : : 2V
)First_Dense_Layer/StatefulPartitionedCall)First_Dense_Layer/StatefulPartitionedCall2\
,Infrared_Dense_Layer/StatefulPartitionedCall,Infrared_Dense_Layer/StatefulPartitionedCall2V
)Lidar_Dense_Layer/StatefulPartitionedCall)Lidar_Dense_Layer/StatefulPartitionedCall2^
-MOR_and_LWC_estimates/StatefulPartitionedCall-MOR_and_LWC_estimates/StatefulPartitionedCall2X
*Second_Dense_Layer/StatefulPartitionedCall*Second_Dense_Layer/StatefulPartitionedCall2V
)Third_Dense_Layer/StatefulPartitionedCall)Third_Dense_Layer/StatefulPartitionedCall2Z
+Visible_Dense_Layer/StatefulPartitionedCall+Visible_Dense_Layer/StatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs:OK
'
_output_shapes
:���������
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs:OK
'
_output_shapes
:���������d
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
K__inference_Lidar_Dense_Layer_layer_call_and_return_conditional_losses_5051

inputs1
matmul_readvariableop_resource:	� -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	� *
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:��������� Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:��������� w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
J__inference_Combined_Visible_layer_call_and_return_conditional_losses_5004

inputs
inputs_1
inputs_2
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
concatConcatV2inputsinputs_1inputs_2concat/axis:output:0*
N*
T0*(
_output_shapes
:����������X
IdentityIdentityconcat:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:���������:����������:����������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
M__inference_Visible_Dense_Layer_layer_call_and_return_conditional_losses_5017

inputs1
matmul_readvariableop_resource:	� -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	� *
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:��������� Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:��������� w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
2__inference_Visible_Dense_Layer_layer_call_fn_5854

inputs
unknown:	� 
	unknown_0: 
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_Visible_Dense_Layer_layer_call_and_return_conditional_losses_5017o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:��������� `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
J__inference_Combined_Neurons_layer_call_and_return_conditional_losses_5065

inputs
inputs_1
inputs_2
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :
concatConcatV2inputsinputs_1inputs_2concat/axis:output:0*
N*
T0*'
_output_shapes
:���������`W
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:���������`"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:��������� :��������� :��������� :O K
'
_output_shapes
:��������� 
 
_user_specified_nameinputs:OK
'
_output_shapes
:��������� 
 
_user_specified_nameinputs:OK
'
_output_shapes
:��������� 
 
_user_specified_nameinputs
�

�
O__inference_MOR_and_LWC_estimates_layer_call_and_return_conditional_losses_5129

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�c
�
__inference__wrapped_model_4956
visible_laplacian_variance
visible_power_spectrum_x
visible_power_spectrum_y
infrared_laplacian_variance
infrared_power_spectrum_x
infrared_power_spectrum_y
lidar_ping_distribution
lidar_depth_mapK
8model_visible_dense_layer_matmul_readvariableop_resource:	� G
9model_visible_dense_layer_biasadd_readvariableop_resource: L
9model_infrared_dense_layer_matmul_readvariableop_resource:	� H
:model_infrared_dense_layer_biasadd_readvariableop_resource: I
6model_lidar_dense_layer_matmul_readvariableop_resource:	� E
7model_lidar_dense_layer_biasadd_readvariableop_resource: H
6model_first_dense_layer_matmul_readvariableop_resource:`@E
7model_first_dense_layer_biasadd_readvariableop_resource:@I
7model_second_dense_layer_matmul_readvariableop_resource:@ F
8model_second_dense_layer_biasadd_readvariableop_resource: H
6model_third_dense_layer_matmul_readvariableop_resource: E
7model_third_dense_layer_biasadd_readvariableop_resource:L
:model_mor_and_lwc_estimates_matmul_readvariableop_resource:I
;model_mor_and_lwc_estimates_biasadd_readvariableop_resource:
identity��.model/First_Dense_Layer/BiasAdd/ReadVariableOp�-model/First_Dense_Layer/MatMul/ReadVariableOp�1model/Infrared_Dense_Layer/BiasAdd/ReadVariableOp�0model/Infrared_Dense_Layer/MatMul/ReadVariableOp�.model/Lidar_Dense_Layer/BiasAdd/ReadVariableOp�-model/Lidar_Dense_Layer/MatMul/ReadVariableOp�2model/MOR_and_LWC_estimates/BiasAdd/ReadVariableOp�1model/MOR_and_LWC_estimates/MatMul/ReadVariableOp�/model/Second_Dense_Layer/BiasAdd/ReadVariableOp�.model/Second_Dense_Layer/MatMul/ReadVariableOp�.model/Third_Dense_Layer/BiasAdd/ReadVariableOp�-model/Third_Dense_Layer/MatMul/ReadVariableOp�0model/Visible_Dense_Layer/BiasAdd/ReadVariableOp�/model/Visible_Dense_Layer/MatMul/ReadVariableOpb
 model/Combined_Lidar/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
model/Combined_Lidar/concatConcatV2lidar_ping_distributionlidar_depth_map)model/Combined_Lidar/concat/axis:output:0*
N*
T0*(
_output_shapes
:����������e
#model/Combined_Infrared/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
model/Combined_Infrared/concatConcatV2infrared_laplacian_varianceinfrared_power_spectrum_xinfrared_power_spectrum_y,model/Combined_Infrared/concat/axis:output:0*
N*
T0*(
_output_shapes
:����������d
"model/Combined_Visible/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
model/Combined_Visible/concatConcatV2visible_laplacian_variancevisible_power_spectrum_xvisible_power_spectrum_y+model/Combined_Visible/concat/axis:output:0*
N*
T0*(
_output_shapes
:�����������
/model/Visible_Dense_Layer/MatMul/ReadVariableOpReadVariableOp8model_visible_dense_layer_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype0�
 model/Visible_Dense_Layer/MatMulMatMul&model/Combined_Visible/concat:output:07model/Visible_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
0model/Visible_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp9model_visible_dense_layer_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
!model/Visible_Dense_Layer/BiasAddBiasAdd*model/Visible_Dense_Layer/MatMul:product:08model/Visible_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
!model/Visible_Dense_Layer/SigmoidSigmoid*model/Visible_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:��������� �
0model/Infrared_Dense_Layer/MatMul/ReadVariableOpReadVariableOp9model_infrared_dense_layer_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype0�
!model/Infrared_Dense_Layer/MatMulMatMul'model/Combined_Infrared/concat:output:08model/Infrared_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
1model/Infrared_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp:model_infrared_dense_layer_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
"model/Infrared_Dense_Layer/BiasAddBiasAdd+model/Infrared_Dense_Layer/MatMul:product:09model/Infrared_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
"model/Infrared_Dense_Layer/SigmoidSigmoid+model/Infrared_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:��������� �
-model/Lidar_Dense_Layer/MatMul/ReadVariableOpReadVariableOp6model_lidar_dense_layer_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype0�
model/Lidar_Dense_Layer/MatMulMatMul$model/Combined_Lidar/concat:output:05model/Lidar_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
.model/Lidar_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp7model_lidar_dense_layer_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
model/Lidar_Dense_Layer/BiasAddBiasAdd(model/Lidar_Dense_Layer/MatMul:product:06model/Lidar_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
model/Lidar_Dense_Layer/SigmoidSigmoid(model/Lidar_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:��������� d
"model/Combined_Neurons/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
model/Combined_Neurons/concatConcatV2%model/Visible_Dense_Layer/Sigmoid:y:0&model/Infrared_Dense_Layer/Sigmoid:y:0#model/Lidar_Dense_Layer/Sigmoid:y:0+model/Combined_Neurons/concat/axis:output:0*
N*
T0*'
_output_shapes
:���������`�
-model/First_Dense_Layer/MatMul/ReadVariableOpReadVariableOp6model_first_dense_layer_matmul_readvariableop_resource*
_output_shapes

:`@*
dtype0�
model/First_Dense_Layer/MatMulMatMul&model/Combined_Neurons/concat:output:05model/First_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@�
.model/First_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp7model_first_dense_layer_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
model/First_Dense_Layer/BiasAddBiasAdd(model/First_Dense_Layer/MatMul:product:06model/First_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@�
model/First_Dense_Layer/SigmoidSigmoid(model/First_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:���������@�
.model/Second_Dense_Layer/MatMul/ReadVariableOpReadVariableOp7model_second_dense_layer_matmul_readvariableop_resource*
_output_shapes

:@ *
dtype0�
model/Second_Dense_Layer/MatMulMatMul#model/First_Dense_Layer/Sigmoid:y:06model/Second_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
/model/Second_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp8model_second_dense_layer_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
 model/Second_Dense_Layer/BiasAddBiasAdd)model/Second_Dense_Layer/MatMul:product:07model/Second_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
 model/Second_Dense_Layer/SigmoidSigmoid)model/Second_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:��������� �
-model/Third_Dense_Layer/MatMul/ReadVariableOpReadVariableOp6model_third_dense_layer_matmul_readvariableop_resource*
_output_shapes

: *
dtype0�
model/Third_Dense_Layer/MatMulMatMul$model/Second_Dense_Layer/Sigmoid:y:05model/Third_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
.model/Third_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp7model_third_dense_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
model/Third_Dense_Layer/BiasAddBiasAdd(model/Third_Dense_Layer/MatMul:product:06model/Third_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
model/Third_Dense_Layer/SigmoidSigmoid(model/Third_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:����������
1model/MOR_and_LWC_estimates/MatMul/ReadVariableOpReadVariableOp:model_mor_and_lwc_estimates_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
"model/MOR_and_LWC_estimates/MatMulMatMul#model/Third_Dense_Layer/Sigmoid:y:09model/MOR_and_LWC_estimates/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
2model/MOR_and_LWC_estimates/BiasAdd/ReadVariableOpReadVariableOp;model_mor_and_lwc_estimates_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
#model/MOR_and_LWC_estimates/BiasAddBiasAdd,model/MOR_and_LWC_estimates/MatMul:product:0:model/MOR_and_LWC_estimates/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
 model/MOR_and_LWC_estimates/ReluRelu,model/MOR_and_LWC_estimates/BiasAdd:output:0*
T0*'
_output_shapes
:���������}
IdentityIdentity.model/MOR_and_LWC_estimates/Relu:activations:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp/^model/First_Dense_Layer/BiasAdd/ReadVariableOp.^model/First_Dense_Layer/MatMul/ReadVariableOp2^model/Infrared_Dense_Layer/BiasAdd/ReadVariableOp1^model/Infrared_Dense_Layer/MatMul/ReadVariableOp/^model/Lidar_Dense_Layer/BiasAdd/ReadVariableOp.^model/Lidar_Dense_Layer/MatMul/ReadVariableOp3^model/MOR_and_LWC_estimates/BiasAdd/ReadVariableOp2^model/MOR_and_LWC_estimates/MatMul/ReadVariableOp0^model/Second_Dense_Layer/BiasAdd/ReadVariableOp/^model/Second_Dense_Layer/MatMul/ReadVariableOp/^model/Third_Dense_Layer/BiasAdd/ReadVariableOp.^model/Third_Dense_Layer/MatMul/ReadVariableOp1^model/Visible_Dense_Layer/BiasAdd/ReadVariableOp0^model/Visible_Dense_Layer/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������:����������:����������:���������:����������:����������:���������d:����������: : : : : : : : : : : : : : 2`
.model/First_Dense_Layer/BiasAdd/ReadVariableOp.model/First_Dense_Layer/BiasAdd/ReadVariableOp2^
-model/First_Dense_Layer/MatMul/ReadVariableOp-model/First_Dense_Layer/MatMul/ReadVariableOp2f
1model/Infrared_Dense_Layer/BiasAdd/ReadVariableOp1model/Infrared_Dense_Layer/BiasAdd/ReadVariableOp2d
0model/Infrared_Dense_Layer/MatMul/ReadVariableOp0model/Infrared_Dense_Layer/MatMul/ReadVariableOp2`
.model/Lidar_Dense_Layer/BiasAdd/ReadVariableOp.model/Lidar_Dense_Layer/BiasAdd/ReadVariableOp2^
-model/Lidar_Dense_Layer/MatMul/ReadVariableOp-model/Lidar_Dense_Layer/MatMul/ReadVariableOp2h
2model/MOR_and_LWC_estimates/BiasAdd/ReadVariableOp2model/MOR_and_LWC_estimates/BiasAdd/ReadVariableOp2f
1model/MOR_and_LWC_estimates/MatMul/ReadVariableOp1model/MOR_and_LWC_estimates/MatMul/ReadVariableOp2b
/model/Second_Dense_Layer/BiasAdd/ReadVariableOp/model/Second_Dense_Layer/BiasAdd/ReadVariableOp2`
.model/Second_Dense_Layer/MatMul/ReadVariableOp.model/Second_Dense_Layer/MatMul/ReadVariableOp2`
.model/Third_Dense_Layer/BiasAdd/ReadVariableOp.model/Third_Dense_Layer/BiasAdd/ReadVariableOp2^
-model/Third_Dense_Layer/MatMul/ReadVariableOp-model/Third_Dense_Layer/MatMul/ReadVariableOp2d
0model/Visible_Dense_Layer/BiasAdd/ReadVariableOp0model/Visible_Dense_Layer/BiasAdd/ReadVariableOp2b
/model/Visible_Dense_Layer/MatMul/ReadVariableOp/model/Visible_Dense_Layer/MatMul/ReadVariableOp:c _
'
_output_shapes
:���������
4
_user_specified_nameVisible_Laplacian_Variance:b^
(
_output_shapes
:����������
2
_user_specified_nameVisible_Power_Spectrum_X:b^
(
_output_shapes
:����������
2
_user_specified_nameVisible_Power_Spectrum_Y:d`
'
_output_shapes
:���������
5
_user_specified_nameInfrared_Laplacian_Variance:c_
(
_output_shapes
:����������
3
_user_specified_nameInfrared_Power_Spectrum_X:c_
(
_output_shapes
:����������
3
_user_specified_nameInfrared_Power_Spectrum_Y:`\
'
_output_shapes
:���������d
1
_user_specified_nameLidar_Ping_Distribution:YU
(
_output_shapes
:����������
)
_user_specified_nameLidar_Depth_Map
�
t
H__inference_Combined_Lidar_layer_call_and_return_conditional_losses_5845
inputs_0
inputs_1
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :x
concatConcatV2inputs_0inputs_1concat/axis:output:0*
N*
T0*(
_output_shapes
:����������X
IdentityIdentityconcat:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������d:����������:Q M
'
_output_shapes
:���������d
"
_user_specified_name
inputs/0:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/1
�
�
"__inference_signature_wrapper_5586
infrared_laplacian_variance
infrared_power_spectrum_x
infrared_power_spectrum_y
lidar_depth_map
lidar_ping_distribution
visible_laplacian_variance
visible_power_spectrum_x
visible_power_spectrum_y
unknown:	� 
	unknown_0: 
	unknown_1:	� 
	unknown_2: 
	unknown_3:	� 
	unknown_4: 
	unknown_5:`@
	unknown_6:@
	unknown_7:@ 
	unknown_8: 
	unknown_9: 

unknown_10:

unknown_11:

unknown_12:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallvisible_laplacian_variancevisible_power_spectrum_xvisible_power_spectrum_yinfrared_laplacian_varianceinfrared_power_spectrum_xinfrared_power_spectrum_ylidar_ping_distributionlidar_depth_mapunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*!
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *(
f#R!
__inference__wrapped_model_4956o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������:����������:����������:����������:���������d:���������:����������:����������: : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:d `
'
_output_shapes
:���������
5
_user_specified_nameInfrared_Laplacian_Variance:c_
(
_output_shapes
:����������
3
_user_specified_nameInfrared_Power_Spectrum_X:c_
(
_output_shapes
:����������
3
_user_specified_nameInfrared_Power_Spectrum_Y:YU
(
_output_shapes
:����������
)
_user_specified_nameLidar_Depth_Map:`\
'
_output_shapes
:���������d
1
_user_specified_nameLidar_Ping_Distribution:c_
'
_output_shapes
:���������
4
_user_specified_nameVisible_Laplacian_Variance:b^
(
_output_shapes
:����������
2
_user_specified_nameVisible_Power_Spectrum_X:b^
(
_output_shapes
:����������
2
_user_specified_nameVisible_Power_Spectrum_Y
�
�
$__inference_model_layer_call_fn_5666
inputs_0
inputs_1
inputs_2
inputs_3
inputs_4
inputs_5
inputs_6
inputs_7
unknown:	� 
	unknown_0: 
	unknown_1:	� 
	unknown_2: 
	unknown_3:	� 
	unknown_4: 
	unknown_5:`@
	unknown_6:@
	unknown_7:@ 
	unknown_8: 
	unknown_9: 

unknown_10:

unknown_11:

unknown_12:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1inputs_2inputs_3inputs_4inputs_5inputs_6inputs_7unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*!
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *H
fCRA
?__inference_model_layer_call_and_return_conditional_losses_5367o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������:����������:����������:���������:����������:����������:���������d:����������: : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/1:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/2:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/3:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/4:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/5:QM
'
_output_shapes
:���������d
"
_user_specified_name
inputs/6:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/7
�Y
�
?__inference_model_layer_call_and_return_conditional_losses_5734
inputs_0
inputs_1
inputs_2
inputs_3
inputs_4
inputs_5
inputs_6
inputs_7E
2visible_dense_layer_matmul_readvariableop_resource:	� A
3visible_dense_layer_biasadd_readvariableop_resource: F
3infrared_dense_layer_matmul_readvariableop_resource:	� B
4infrared_dense_layer_biasadd_readvariableop_resource: C
0lidar_dense_layer_matmul_readvariableop_resource:	� ?
1lidar_dense_layer_biasadd_readvariableop_resource: B
0first_dense_layer_matmul_readvariableop_resource:`@?
1first_dense_layer_biasadd_readvariableop_resource:@C
1second_dense_layer_matmul_readvariableop_resource:@ @
2second_dense_layer_biasadd_readvariableop_resource: B
0third_dense_layer_matmul_readvariableop_resource: ?
1third_dense_layer_biasadd_readvariableop_resource:F
4mor_and_lwc_estimates_matmul_readvariableop_resource:C
5mor_and_lwc_estimates_biasadd_readvariableop_resource:
identity��(First_Dense_Layer/BiasAdd/ReadVariableOp�'First_Dense_Layer/MatMul/ReadVariableOp�+Infrared_Dense_Layer/BiasAdd/ReadVariableOp�*Infrared_Dense_Layer/MatMul/ReadVariableOp�(Lidar_Dense_Layer/BiasAdd/ReadVariableOp�'Lidar_Dense_Layer/MatMul/ReadVariableOp�,MOR_and_LWC_estimates/BiasAdd/ReadVariableOp�+MOR_and_LWC_estimates/MatMul/ReadVariableOp�)Second_Dense_Layer/BiasAdd/ReadVariableOp�(Second_Dense_Layer/MatMul/ReadVariableOp�(Third_Dense_Layer/BiasAdd/ReadVariableOp�'Third_Dense_Layer/MatMul/ReadVariableOp�*Visible_Dense_Layer/BiasAdd/ReadVariableOp�)Visible_Dense_Layer/MatMul/ReadVariableOp\
Combined_Lidar/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
Combined_Lidar/concatConcatV2inputs_6inputs_7#Combined_Lidar/concat/axis:output:0*
N*
T0*(
_output_shapes
:����������_
Combined_Infrared/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
Combined_Infrared/concatConcatV2inputs_3inputs_4inputs_5&Combined_Infrared/concat/axis:output:0*
N*
T0*(
_output_shapes
:����������^
Combined_Visible/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
Combined_Visible/concatConcatV2inputs_0inputs_1inputs_2%Combined_Visible/concat/axis:output:0*
N*
T0*(
_output_shapes
:�����������
)Visible_Dense_Layer/MatMul/ReadVariableOpReadVariableOp2visible_dense_layer_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype0�
Visible_Dense_Layer/MatMulMatMul Combined_Visible/concat:output:01Visible_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
*Visible_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp3visible_dense_layer_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
Visible_Dense_Layer/BiasAddBiasAdd$Visible_Dense_Layer/MatMul:product:02Visible_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� ~
Visible_Dense_Layer/SigmoidSigmoid$Visible_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:��������� �
*Infrared_Dense_Layer/MatMul/ReadVariableOpReadVariableOp3infrared_dense_layer_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype0�
Infrared_Dense_Layer/MatMulMatMul!Combined_Infrared/concat:output:02Infrared_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
+Infrared_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp4infrared_dense_layer_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
Infrared_Dense_Layer/BiasAddBiasAdd%Infrared_Dense_Layer/MatMul:product:03Infrared_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
Infrared_Dense_Layer/SigmoidSigmoid%Infrared_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:��������� �
'Lidar_Dense_Layer/MatMul/ReadVariableOpReadVariableOp0lidar_dense_layer_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype0�
Lidar_Dense_Layer/MatMulMatMulCombined_Lidar/concat:output:0/Lidar_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
(Lidar_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp1lidar_dense_layer_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
Lidar_Dense_Layer/BiasAddBiasAdd"Lidar_Dense_Layer/MatMul:product:00Lidar_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� z
Lidar_Dense_Layer/SigmoidSigmoid"Lidar_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:��������� ^
Combined_Neurons/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
Combined_Neurons/concatConcatV2Visible_Dense_Layer/Sigmoid:y:0 Infrared_Dense_Layer/Sigmoid:y:0Lidar_Dense_Layer/Sigmoid:y:0%Combined_Neurons/concat/axis:output:0*
N*
T0*'
_output_shapes
:���������`�
'First_Dense_Layer/MatMul/ReadVariableOpReadVariableOp0first_dense_layer_matmul_readvariableop_resource*
_output_shapes

:`@*
dtype0�
First_Dense_Layer/MatMulMatMul Combined_Neurons/concat:output:0/First_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@�
(First_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp1first_dense_layer_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
First_Dense_Layer/BiasAddBiasAdd"First_Dense_Layer/MatMul:product:00First_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@z
First_Dense_Layer/SigmoidSigmoid"First_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:���������@�
(Second_Dense_Layer/MatMul/ReadVariableOpReadVariableOp1second_dense_layer_matmul_readvariableop_resource*
_output_shapes

:@ *
dtype0�
Second_Dense_Layer/MatMulMatMulFirst_Dense_Layer/Sigmoid:y:00Second_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
)Second_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp2second_dense_layer_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
Second_Dense_Layer/BiasAddBiasAdd#Second_Dense_Layer/MatMul:product:01Second_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� |
Second_Dense_Layer/SigmoidSigmoid#Second_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:��������� �
'Third_Dense_Layer/MatMul/ReadVariableOpReadVariableOp0third_dense_layer_matmul_readvariableop_resource*
_output_shapes

: *
dtype0�
Third_Dense_Layer/MatMulMatMulSecond_Dense_Layer/Sigmoid:y:0/Third_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
(Third_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp1third_dense_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Third_Dense_Layer/BiasAddBiasAdd"Third_Dense_Layer/MatMul:product:00Third_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������z
Third_Dense_Layer/SigmoidSigmoid"Third_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:����������
+MOR_and_LWC_estimates/MatMul/ReadVariableOpReadVariableOp4mor_and_lwc_estimates_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
MOR_and_LWC_estimates/MatMulMatMulThird_Dense_Layer/Sigmoid:y:03MOR_and_LWC_estimates/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
,MOR_and_LWC_estimates/BiasAdd/ReadVariableOpReadVariableOp5mor_and_lwc_estimates_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
MOR_and_LWC_estimates/BiasAddBiasAdd&MOR_and_LWC_estimates/MatMul:product:04MOR_and_LWC_estimates/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������|
MOR_and_LWC_estimates/ReluRelu&MOR_and_LWC_estimates/BiasAdd:output:0*
T0*'
_output_shapes
:���������w
IdentityIdentity(MOR_and_LWC_estimates/Relu:activations:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp)^First_Dense_Layer/BiasAdd/ReadVariableOp(^First_Dense_Layer/MatMul/ReadVariableOp,^Infrared_Dense_Layer/BiasAdd/ReadVariableOp+^Infrared_Dense_Layer/MatMul/ReadVariableOp)^Lidar_Dense_Layer/BiasAdd/ReadVariableOp(^Lidar_Dense_Layer/MatMul/ReadVariableOp-^MOR_and_LWC_estimates/BiasAdd/ReadVariableOp,^MOR_and_LWC_estimates/MatMul/ReadVariableOp*^Second_Dense_Layer/BiasAdd/ReadVariableOp)^Second_Dense_Layer/MatMul/ReadVariableOp)^Third_Dense_Layer/BiasAdd/ReadVariableOp(^Third_Dense_Layer/MatMul/ReadVariableOp+^Visible_Dense_Layer/BiasAdd/ReadVariableOp*^Visible_Dense_Layer/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������:����������:����������:���������:����������:����������:���������d:����������: : : : : : : : : : : : : : 2T
(First_Dense_Layer/BiasAdd/ReadVariableOp(First_Dense_Layer/BiasAdd/ReadVariableOp2R
'First_Dense_Layer/MatMul/ReadVariableOp'First_Dense_Layer/MatMul/ReadVariableOp2Z
+Infrared_Dense_Layer/BiasAdd/ReadVariableOp+Infrared_Dense_Layer/BiasAdd/ReadVariableOp2X
*Infrared_Dense_Layer/MatMul/ReadVariableOp*Infrared_Dense_Layer/MatMul/ReadVariableOp2T
(Lidar_Dense_Layer/BiasAdd/ReadVariableOp(Lidar_Dense_Layer/BiasAdd/ReadVariableOp2R
'Lidar_Dense_Layer/MatMul/ReadVariableOp'Lidar_Dense_Layer/MatMul/ReadVariableOp2\
,MOR_and_LWC_estimates/BiasAdd/ReadVariableOp,MOR_and_LWC_estimates/BiasAdd/ReadVariableOp2Z
+MOR_and_LWC_estimates/MatMul/ReadVariableOp+MOR_and_LWC_estimates/MatMul/ReadVariableOp2V
)Second_Dense_Layer/BiasAdd/ReadVariableOp)Second_Dense_Layer/BiasAdd/ReadVariableOp2T
(Second_Dense_Layer/MatMul/ReadVariableOp(Second_Dense_Layer/MatMul/ReadVariableOp2T
(Third_Dense_Layer/BiasAdd/ReadVariableOp(Third_Dense_Layer/BiasAdd/ReadVariableOp2R
'Third_Dense_Layer/MatMul/ReadVariableOp'Third_Dense_Layer/MatMul/ReadVariableOp2X
*Visible_Dense_Layer/BiasAdd/ReadVariableOp*Visible_Dense_Layer/BiasAdd/ReadVariableOp2V
)Visible_Dense_Layer/MatMul/ReadVariableOp)Visible_Dense_Layer/MatMul/ReadVariableOp:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/1:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/2:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/3:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/4:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/5:QM
'
_output_shapes
:���������d
"
_user_specified_name
inputs/6:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/7
�
�
K__inference_Combined_Infrared_layer_call_and_return_conditional_losses_5832
inputs_0
inputs_1
inputs_2
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
concatConcatV2inputs_0inputs_1inputs_2concat/axis:output:0*
N*
T0*(
_output_shapes
:����������X
IdentityIdentityconcat:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:���������:����������:����������:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/1:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/2
�
�
J__inference_Combined_Neurons_layer_call_and_return_conditional_losses_5920
inputs_0
inputs_1
inputs_2
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
concatConcatV2inputs_0inputs_1inputs_2concat/axis:output:0*
N*
T0*'
_output_shapes
:���������`W
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:���������`"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:��������� :��������� :��������� :Q M
'
_output_shapes
:��������� 
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:��������� 
"
_user_specified_name
inputs/1:QM
'
_output_shapes
:��������� 
"
_user_specified_name
inputs/2
�

�
N__inference_Infrared_Dense_Layer_layer_call_and_return_conditional_losses_5885

inputs1
matmul_readvariableop_resource:	� -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	� *
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:��������� Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:��������� w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
M__inference_Visible_Dense_Layer_layer_call_and_return_conditional_losses_5865

inputs1
matmul_readvariableop_resource:	� -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	� *
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:��������� Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:��������� w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
0__inference_First_Dense_Layer_layer_call_fn_5929

inputs
unknown:`@
	unknown_0:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_First_Dense_Layer_layer_call_and_return_conditional_losses_5078o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������`: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������`
 
_user_specified_nameinputs
�
�
4__inference_MOR_and_LWC_estimates_layer_call_fn_5989

inputs
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_MOR_and_LWC_estimates_layer_call_and_return_conditional_losses_5129o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
��
�"
 __inference__traced_restore_6346
file_prefix>
+assignvariableop_visible_dense_layer_kernel:	� 9
+assignvariableop_1_visible_dense_layer_bias: A
.assignvariableop_2_infrared_dense_layer_kernel:	� :
,assignvariableop_3_infrared_dense_layer_bias: >
+assignvariableop_4_lidar_dense_layer_kernel:	� 7
)assignvariableop_5_lidar_dense_layer_bias: =
+assignvariableop_6_first_dense_layer_kernel:`@7
)assignvariableop_7_first_dense_layer_bias:@>
,assignvariableop_8_second_dense_layer_kernel:@ 8
*assignvariableop_9_second_dense_layer_bias: >
,assignvariableop_10_third_dense_layer_kernel: 8
*assignvariableop_11_third_dense_layer_bias:B
0assignvariableop_12_mor_and_lwc_estimates_kernel:<
.assignvariableop_13_mor_and_lwc_estimates_bias:'
assignvariableop_14_adam_iter:	 )
assignvariableop_15_adam_beta_1: )
assignvariableop_16_adam_beta_2: (
assignvariableop_17_adam_decay: 0
&assignvariableop_18_adam_learning_rate: %
assignvariableop_19_total_1: %
assignvariableop_20_count_1: #
assignvariableop_21_total: #
assignvariableop_22_count: H
5assignvariableop_23_adam_visible_dense_layer_kernel_m:	� A
3assignvariableop_24_adam_visible_dense_layer_bias_m: I
6assignvariableop_25_adam_infrared_dense_layer_kernel_m:	� B
4assignvariableop_26_adam_infrared_dense_layer_bias_m: F
3assignvariableop_27_adam_lidar_dense_layer_kernel_m:	� ?
1assignvariableop_28_adam_lidar_dense_layer_bias_m: E
3assignvariableop_29_adam_first_dense_layer_kernel_m:`@?
1assignvariableop_30_adam_first_dense_layer_bias_m:@F
4assignvariableop_31_adam_second_dense_layer_kernel_m:@ @
2assignvariableop_32_adam_second_dense_layer_bias_m: E
3assignvariableop_33_adam_third_dense_layer_kernel_m: ?
1assignvariableop_34_adam_third_dense_layer_bias_m:I
7assignvariableop_35_adam_mor_and_lwc_estimates_kernel_m:C
5assignvariableop_36_adam_mor_and_lwc_estimates_bias_m:H
5assignvariableop_37_adam_visible_dense_layer_kernel_v:	� A
3assignvariableop_38_adam_visible_dense_layer_bias_v: I
6assignvariableop_39_adam_infrared_dense_layer_kernel_v:	� B
4assignvariableop_40_adam_infrared_dense_layer_bias_v: F
3assignvariableop_41_adam_lidar_dense_layer_kernel_v:	� ?
1assignvariableop_42_adam_lidar_dense_layer_bias_v: E
3assignvariableop_43_adam_first_dense_layer_kernel_v:`@?
1assignvariableop_44_adam_first_dense_layer_bias_v:@F
4assignvariableop_45_adam_second_dense_layer_kernel_v:@ @
2assignvariableop_46_adam_second_dense_layer_bias_v: E
3assignvariableop_47_adam_third_dense_layer_kernel_v: ?
1assignvariableop_48_adam_third_dense_layer_bias_v:I
7assignvariableop_49_adam_mor_and_lwc_estimates_kernel_v:C
5assignvariableop_50_adam_mor_and_lwc_estimates_bias_v:
identity_52��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_16�AssignVariableOp_17�AssignVariableOp_18�AssignVariableOp_19�AssignVariableOp_2�AssignVariableOp_20�AssignVariableOp_21�AssignVariableOp_22�AssignVariableOp_23�AssignVariableOp_24�AssignVariableOp_25�AssignVariableOp_26�AssignVariableOp_27�AssignVariableOp_28�AssignVariableOp_29�AssignVariableOp_3�AssignVariableOp_30�AssignVariableOp_31�AssignVariableOp_32�AssignVariableOp_33�AssignVariableOp_34�AssignVariableOp_35�AssignVariableOp_36�AssignVariableOp_37�AssignVariableOp_38�AssignVariableOp_39�AssignVariableOp_4�AssignVariableOp_40�AssignVariableOp_41�AssignVariableOp_42�AssignVariableOp_43�AssignVariableOp_44�AssignVariableOp_45�AssignVariableOp_46�AssignVariableOp_47�AssignVariableOp_48�AssignVariableOp_49�AssignVariableOp_5�AssignVariableOp_50�AssignVariableOp_6�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:4*
dtype0*�
value�B�4B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:4*
dtype0*{
valuerBp4B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*�
_output_shapes�
�::::::::::::::::::::::::::::::::::::::::::::::::::::*B
dtypes8
624	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOpAssignVariableOp+assignvariableop_visible_dense_layer_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_1AssignVariableOp+assignvariableop_1_visible_dense_layer_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOp.assignvariableop_2_infrared_dense_layer_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_3AssignVariableOp,assignvariableop_3_infrared_dense_layer_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_4AssignVariableOp+assignvariableop_4_lidar_dense_layer_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_5AssignVariableOp)assignvariableop_5_lidar_dense_layer_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_6AssignVariableOp+assignvariableop_6_first_dense_layer_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_7AssignVariableOp)assignvariableop_7_first_dense_layer_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_8AssignVariableOp,assignvariableop_8_second_dense_layer_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_9AssignVariableOp*assignvariableop_9_second_dense_layer_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_10AssignVariableOp,assignvariableop_10_third_dense_layer_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_11AssignVariableOp*assignvariableop_11_third_dense_layer_biasIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_12AssignVariableOp0assignvariableop_12_mor_and_lwc_estimates_kernelIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_13AssignVariableOp.assignvariableop_13_mor_and_lwc_estimates_biasIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_14AssignVariableOpassignvariableop_14_adam_iterIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_15AssignVariableOpassignvariableop_15_adam_beta_1Identity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_16AssignVariableOpassignvariableop_16_adam_beta_2Identity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_17AssignVariableOpassignvariableop_17_adam_decayIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_18AssignVariableOp&assignvariableop_18_adam_learning_rateIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_19AssignVariableOpassignvariableop_19_total_1Identity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_20AssignVariableOpassignvariableop_20_count_1Identity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_21AssignVariableOpassignvariableop_21_totalIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_22AssignVariableOpassignvariableop_22_countIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_23AssignVariableOp5assignvariableop_23_adam_visible_dense_layer_kernel_mIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_24AssignVariableOp3assignvariableop_24_adam_visible_dense_layer_bias_mIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_25AssignVariableOp6assignvariableop_25_adam_infrared_dense_layer_kernel_mIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_26AssignVariableOp4assignvariableop_26_adam_infrared_dense_layer_bias_mIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_27AssignVariableOp3assignvariableop_27_adam_lidar_dense_layer_kernel_mIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_28AssignVariableOp1assignvariableop_28_adam_lidar_dense_layer_bias_mIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_29AssignVariableOp3assignvariableop_29_adam_first_dense_layer_kernel_mIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_30AssignVariableOp1assignvariableop_30_adam_first_dense_layer_bias_mIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_31AssignVariableOp4assignvariableop_31_adam_second_dense_layer_kernel_mIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_32AssignVariableOp2assignvariableop_32_adam_second_dense_layer_bias_mIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_33AssignVariableOp3assignvariableop_33_adam_third_dense_layer_kernel_mIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_34AssignVariableOp1assignvariableop_34_adam_third_dense_layer_bias_mIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_35AssignVariableOp7assignvariableop_35_adam_mor_and_lwc_estimates_kernel_mIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_36AssignVariableOp5assignvariableop_36_adam_mor_and_lwc_estimates_bias_mIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_37AssignVariableOp5assignvariableop_37_adam_visible_dense_layer_kernel_vIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_38AssignVariableOp3assignvariableop_38_adam_visible_dense_layer_bias_vIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_39AssignVariableOp6assignvariableop_39_adam_infrared_dense_layer_kernel_vIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_40AssignVariableOp4assignvariableop_40_adam_infrared_dense_layer_bias_vIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_41AssignVariableOp3assignvariableop_41_adam_lidar_dense_layer_kernel_vIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_42AssignVariableOp1assignvariableop_42_adam_lidar_dense_layer_bias_vIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_43AssignVariableOp3assignvariableop_43_adam_first_dense_layer_kernel_vIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_44AssignVariableOp1assignvariableop_44_adam_first_dense_layer_bias_vIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_45AssignVariableOp4assignvariableop_45_adam_second_dense_layer_kernel_vIdentity_45:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_46AssignVariableOp2assignvariableop_46_adam_second_dense_layer_bias_vIdentity_46:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_47AssignVariableOp3assignvariableop_47_adam_third_dense_layer_kernel_vIdentity_47:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_48AssignVariableOp1assignvariableop_48_adam_third_dense_layer_bias_vIdentity_48:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_49IdentityRestoreV2:tensors:49"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_49AssignVariableOp7assignvariableop_49_adam_mor_and_lwc_estimates_kernel_vIdentity_49:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_50IdentityRestoreV2:tensors:50"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_50AssignVariableOp5assignvariableop_50_adam_mor_and_lwc_estimates_bias_vIdentity_50:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 �	
Identity_51Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_52IdentityIdentity_51:output:0^NoOp_1*
T0*
_output_shapes
: �	
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_52Identity_52:output:0*{
_input_shapesj
h: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442*
AssignVariableOp_45AssignVariableOp_452*
AssignVariableOp_46AssignVariableOp_462*
AssignVariableOp_47AssignVariableOp_472*
AssignVariableOp_48AssignVariableOp_482*
AssignVariableOp_49AssignVariableOp_492(
AssignVariableOp_5AssignVariableOp_52*
AssignVariableOp_50AssignVariableOp_502(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�@
�	
?__inference_model_layer_call_and_return_conditional_losses_5488
visible_laplacian_variance
visible_power_spectrum_x
visible_power_spectrum_y
infrared_laplacian_variance
infrared_power_spectrum_x
infrared_power_spectrum_y
lidar_ping_distribution
lidar_depth_map+
visible_dense_layer_5451:	� &
visible_dense_layer_5453: ,
infrared_dense_layer_5456:	� '
infrared_dense_layer_5458: )
lidar_dense_layer_5461:	� $
lidar_dense_layer_5463: (
first_dense_layer_5467:`@$
first_dense_layer_5469:@)
second_dense_layer_5472:@ %
second_dense_layer_5474: (
third_dense_layer_5477: $
third_dense_layer_5479:,
mor_and_lwc_estimates_5482:(
mor_and_lwc_estimates_5484:
identity��)First_Dense_Layer/StatefulPartitionedCall�,Infrared_Dense_Layer/StatefulPartitionedCall�)Lidar_Dense_Layer/StatefulPartitionedCall�-MOR_and_LWC_estimates/StatefulPartitionedCall�*Second_Dense_Layer/StatefulPartitionedCall�)Third_Dense_Layer/StatefulPartitionedCall�+Visible_Dense_Layer/StatefulPartitionedCall�
Combined_Lidar/PartitionedCallPartitionedCalllidar_ping_distributionlidar_depth_map*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *Q
fLRJ
H__inference_Combined_Lidar_layer_call_and_return_conditional_losses_4984�
!Combined_Infrared/PartitionedCallPartitionedCallinfrared_laplacian_varianceinfrared_power_spectrum_xinfrared_power_spectrum_y*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Combined_Infrared_layer_call_and_return_conditional_losses_4994�
 Combined_Visible/PartitionedCallPartitionedCallvisible_laplacian_variancevisible_power_spectrum_xvisible_power_spectrum_y*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_Combined_Visible_layer_call_and_return_conditional_losses_5004�
+Visible_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall)Combined_Visible/PartitionedCall:output:0visible_dense_layer_5451visible_dense_layer_5453*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_Visible_Dense_Layer_layer_call_and_return_conditional_losses_5017�
,Infrared_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall*Combined_Infrared/PartitionedCall:output:0infrared_dense_layer_5456infrared_dense_layer_5458*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_Infrared_Dense_Layer_layer_call_and_return_conditional_losses_5034�
)Lidar_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall'Combined_Lidar/PartitionedCall:output:0lidar_dense_layer_5461lidar_dense_layer_5463*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Lidar_Dense_Layer_layer_call_and_return_conditional_losses_5051�
 Combined_Neurons/PartitionedCallPartitionedCall4Visible_Dense_Layer/StatefulPartitionedCall:output:05Infrared_Dense_Layer/StatefulPartitionedCall:output:02Lidar_Dense_Layer/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������`* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_Combined_Neurons_layer_call_and_return_conditional_losses_5065�
)First_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall)Combined_Neurons/PartitionedCall:output:0first_dense_layer_5467first_dense_layer_5469*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_First_Dense_Layer_layer_call_and_return_conditional_losses_5078�
*Second_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall2First_Dense_Layer/StatefulPartitionedCall:output:0second_dense_layer_5472second_dense_layer_5474*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_Second_Dense_Layer_layer_call_and_return_conditional_losses_5095�
)Third_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall3Second_Dense_Layer/StatefulPartitionedCall:output:0third_dense_layer_5477third_dense_layer_5479*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Third_Dense_Layer_layer_call_and_return_conditional_losses_5112�
-MOR_and_LWC_estimates/StatefulPartitionedCallStatefulPartitionedCall2Third_Dense_Layer/StatefulPartitionedCall:output:0mor_and_lwc_estimates_5482mor_and_lwc_estimates_5484*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_MOR_and_LWC_estimates_layer_call_and_return_conditional_losses_5129�
IdentityIdentity6MOR_and_LWC_estimates/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp*^First_Dense_Layer/StatefulPartitionedCall-^Infrared_Dense_Layer/StatefulPartitionedCall*^Lidar_Dense_Layer/StatefulPartitionedCall.^MOR_and_LWC_estimates/StatefulPartitionedCall+^Second_Dense_Layer/StatefulPartitionedCall*^Third_Dense_Layer/StatefulPartitionedCall,^Visible_Dense_Layer/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������:����������:����������:���������:����������:����������:���������d:����������: : : : : : : : : : : : : : 2V
)First_Dense_Layer/StatefulPartitionedCall)First_Dense_Layer/StatefulPartitionedCall2\
,Infrared_Dense_Layer/StatefulPartitionedCall,Infrared_Dense_Layer/StatefulPartitionedCall2V
)Lidar_Dense_Layer/StatefulPartitionedCall)Lidar_Dense_Layer/StatefulPartitionedCall2^
-MOR_and_LWC_estimates/StatefulPartitionedCall-MOR_and_LWC_estimates/StatefulPartitionedCall2X
*Second_Dense_Layer/StatefulPartitionedCall*Second_Dense_Layer/StatefulPartitionedCall2V
)Third_Dense_Layer/StatefulPartitionedCall)Third_Dense_Layer/StatefulPartitionedCall2Z
+Visible_Dense_Layer/StatefulPartitionedCall+Visible_Dense_Layer/StatefulPartitionedCall:c _
'
_output_shapes
:���������
4
_user_specified_nameVisible_Laplacian_Variance:b^
(
_output_shapes
:����������
2
_user_specified_nameVisible_Power_Spectrum_X:b^
(
_output_shapes
:����������
2
_user_specified_nameVisible_Power_Spectrum_Y:d`
'
_output_shapes
:���������
5
_user_specified_nameInfrared_Laplacian_Variance:c_
(
_output_shapes
:����������
3
_user_specified_nameInfrared_Power_Spectrum_X:c_
(
_output_shapes
:����������
3
_user_specified_nameInfrared_Power_Spectrum_Y:`\
'
_output_shapes
:���������d
1
_user_specified_nameLidar_Ping_Distribution:YU
(
_output_shapes
:����������
)
_user_specified_nameLidar_Depth_Map
�Y
�
?__inference_model_layer_call_and_return_conditional_losses_5802
inputs_0
inputs_1
inputs_2
inputs_3
inputs_4
inputs_5
inputs_6
inputs_7E
2visible_dense_layer_matmul_readvariableop_resource:	� A
3visible_dense_layer_biasadd_readvariableop_resource: F
3infrared_dense_layer_matmul_readvariableop_resource:	� B
4infrared_dense_layer_biasadd_readvariableop_resource: C
0lidar_dense_layer_matmul_readvariableop_resource:	� ?
1lidar_dense_layer_biasadd_readvariableop_resource: B
0first_dense_layer_matmul_readvariableop_resource:`@?
1first_dense_layer_biasadd_readvariableop_resource:@C
1second_dense_layer_matmul_readvariableop_resource:@ @
2second_dense_layer_biasadd_readvariableop_resource: B
0third_dense_layer_matmul_readvariableop_resource: ?
1third_dense_layer_biasadd_readvariableop_resource:F
4mor_and_lwc_estimates_matmul_readvariableop_resource:C
5mor_and_lwc_estimates_biasadd_readvariableop_resource:
identity��(First_Dense_Layer/BiasAdd/ReadVariableOp�'First_Dense_Layer/MatMul/ReadVariableOp�+Infrared_Dense_Layer/BiasAdd/ReadVariableOp�*Infrared_Dense_Layer/MatMul/ReadVariableOp�(Lidar_Dense_Layer/BiasAdd/ReadVariableOp�'Lidar_Dense_Layer/MatMul/ReadVariableOp�,MOR_and_LWC_estimates/BiasAdd/ReadVariableOp�+MOR_and_LWC_estimates/MatMul/ReadVariableOp�)Second_Dense_Layer/BiasAdd/ReadVariableOp�(Second_Dense_Layer/MatMul/ReadVariableOp�(Third_Dense_Layer/BiasAdd/ReadVariableOp�'Third_Dense_Layer/MatMul/ReadVariableOp�*Visible_Dense_Layer/BiasAdd/ReadVariableOp�)Visible_Dense_Layer/MatMul/ReadVariableOp\
Combined_Lidar/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
Combined_Lidar/concatConcatV2inputs_6inputs_7#Combined_Lidar/concat/axis:output:0*
N*
T0*(
_output_shapes
:����������_
Combined_Infrared/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
Combined_Infrared/concatConcatV2inputs_3inputs_4inputs_5&Combined_Infrared/concat/axis:output:0*
N*
T0*(
_output_shapes
:����������^
Combined_Visible/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
Combined_Visible/concatConcatV2inputs_0inputs_1inputs_2%Combined_Visible/concat/axis:output:0*
N*
T0*(
_output_shapes
:�����������
)Visible_Dense_Layer/MatMul/ReadVariableOpReadVariableOp2visible_dense_layer_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype0�
Visible_Dense_Layer/MatMulMatMul Combined_Visible/concat:output:01Visible_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
*Visible_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp3visible_dense_layer_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
Visible_Dense_Layer/BiasAddBiasAdd$Visible_Dense_Layer/MatMul:product:02Visible_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� ~
Visible_Dense_Layer/SigmoidSigmoid$Visible_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:��������� �
*Infrared_Dense_Layer/MatMul/ReadVariableOpReadVariableOp3infrared_dense_layer_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype0�
Infrared_Dense_Layer/MatMulMatMul!Combined_Infrared/concat:output:02Infrared_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
+Infrared_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp4infrared_dense_layer_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
Infrared_Dense_Layer/BiasAddBiasAdd%Infrared_Dense_Layer/MatMul:product:03Infrared_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
Infrared_Dense_Layer/SigmoidSigmoid%Infrared_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:��������� �
'Lidar_Dense_Layer/MatMul/ReadVariableOpReadVariableOp0lidar_dense_layer_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype0�
Lidar_Dense_Layer/MatMulMatMulCombined_Lidar/concat:output:0/Lidar_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
(Lidar_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp1lidar_dense_layer_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
Lidar_Dense_Layer/BiasAddBiasAdd"Lidar_Dense_Layer/MatMul:product:00Lidar_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� z
Lidar_Dense_Layer/SigmoidSigmoid"Lidar_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:��������� ^
Combined_Neurons/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
Combined_Neurons/concatConcatV2Visible_Dense_Layer/Sigmoid:y:0 Infrared_Dense_Layer/Sigmoid:y:0Lidar_Dense_Layer/Sigmoid:y:0%Combined_Neurons/concat/axis:output:0*
N*
T0*'
_output_shapes
:���������`�
'First_Dense_Layer/MatMul/ReadVariableOpReadVariableOp0first_dense_layer_matmul_readvariableop_resource*
_output_shapes

:`@*
dtype0�
First_Dense_Layer/MatMulMatMul Combined_Neurons/concat:output:0/First_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@�
(First_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp1first_dense_layer_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
First_Dense_Layer/BiasAddBiasAdd"First_Dense_Layer/MatMul:product:00First_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@z
First_Dense_Layer/SigmoidSigmoid"First_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:���������@�
(Second_Dense_Layer/MatMul/ReadVariableOpReadVariableOp1second_dense_layer_matmul_readvariableop_resource*
_output_shapes

:@ *
dtype0�
Second_Dense_Layer/MatMulMatMulFirst_Dense_Layer/Sigmoid:y:00Second_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� �
)Second_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp2second_dense_layer_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
Second_Dense_Layer/BiasAddBiasAdd#Second_Dense_Layer/MatMul:product:01Second_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� |
Second_Dense_Layer/SigmoidSigmoid#Second_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:��������� �
'Third_Dense_Layer/MatMul/ReadVariableOpReadVariableOp0third_dense_layer_matmul_readvariableop_resource*
_output_shapes

: *
dtype0�
Third_Dense_Layer/MatMulMatMulSecond_Dense_Layer/Sigmoid:y:0/Third_Dense_Layer/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
(Third_Dense_Layer/BiasAdd/ReadVariableOpReadVariableOp1third_dense_layer_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
Third_Dense_Layer/BiasAddBiasAdd"Third_Dense_Layer/MatMul:product:00Third_Dense_Layer/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������z
Third_Dense_Layer/SigmoidSigmoid"Third_Dense_Layer/BiasAdd:output:0*
T0*'
_output_shapes
:����������
+MOR_and_LWC_estimates/MatMul/ReadVariableOpReadVariableOp4mor_and_lwc_estimates_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
MOR_and_LWC_estimates/MatMulMatMulThird_Dense_Layer/Sigmoid:y:03MOR_and_LWC_estimates/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
,MOR_and_LWC_estimates/BiasAdd/ReadVariableOpReadVariableOp5mor_and_lwc_estimates_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
MOR_and_LWC_estimates/BiasAddBiasAdd&MOR_and_LWC_estimates/MatMul:product:04MOR_and_LWC_estimates/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������|
MOR_and_LWC_estimates/ReluRelu&MOR_and_LWC_estimates/BiasAdd:output:0*
T0*'
_output_shapes
:���������w
IdentityIdentity(MOR_and_LWC_estimates/Relu:activations:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp)^First_Dense_Layer/BiasAdd/ReadVariableOp(^First_Dense_Layer/MatMul/ReadVariableOp,^Infrared_Dense_Layer/BiasAdd/ReadVariableOp+^Infrared_Dense_Layer/MatMul/ReadVariableOp)^Lidar_Dense_Layer/BiasAdd/ReadVariableOp(^Lidar_Dense_Layer/MatMul/ReadVariableOp-^MOR_and_LWC_estimates/BiasAdd/ReadVariableOp,^MOR_and_LWC_estimates/MatMul/ReadVariableOp*^Second_Dense_Layer/BiasAdd/ReadVariableOp)^Second_Dense_Layer/MatMul/ReadVariableOp)^Third_Dense_Layer/BiasAdd/ReadVariableOp(^Third_Dense_Layer/MatMul/ReadVariableOp+^Visible_Dense_Layer/BiasAdd/ReadVariableOp*^Visible_Dense_Layer/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������:����������:����������:���������:����������:����������:���������d:����������: : : : : : : : : : : : : : 2T
(First_Dense_Layer/BiasAdd/ReadVariableOp(First_Dense_Layer/BiasAdd/ReadVariableOp2R
'First_Dense_Layer/MatMul/ReadVariableOp'First_Dense_Layer/MatMul/ReadVariableOp2Z
+Infrared_Dense_Layer/BiasAdd/ReadVariableOp+Infrared_Dense_Layer/BiasAdd/ReadVariableOp2X
*Infrared_Dense_Layer/MatMul/ReadVariableOp*Infrared_Dense_Layer/MatMul/ReadVariableOp2T
(Lidar_Dense_Layer/BiasAdd/ReadVariableOp(Lidar_Dense_Layer/BiasAdd/ReadVariableOp2R
'Lidar_Dense_Layer/MatMul/ReadVariableOp'Lidar_Dense_Layer/MatMul/ReadVariableOp2\
,MOR_and_LWC_estimates/BiasAdd/ReadVariableOp,MOR_and_LWC_estimates/BiasAdd/ReadVariableOp2Z
+MOR_and_LWC_estimates/MatMul/ReadVariableOp+MOR_and_LWC_estimates/MatMul/ReadVariableOp2V
)Second_Dense_Layer/BiasAdd/ReadVariableOp)Second_Dense_Layer/BiasAdd/ReadVariableOp2T
(Second_Dense_Layer/MatMul/ReadVariableOp(Second_Dense_Layer/MatMul/ReadVariableOp2T
(Third_Dense_Layer/BiasAdd/ReadVariableOp(Third_Dense_Layer/BiasAdd/ReadVariableOp2R
'Third_Dense_Layer/MatMul/ReadVariableOp'Third_Dense_Layer/MatMul/ReadVariableOp2X
*Visible_Dense_Layer/BiasAdd/ReadVariableOp*Visible_Dense_Layer/BiasAdd/ReadVariableOp2V
)Visible_Dense_Layer/MatMul/ReadVariableOp)Visible_Dense_Layer/MatMul/ReadVariableOp:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/1:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/2:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/3:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/4:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/5:QM
'
_output_shapes
:���������d
"
_user_specified_name
inputs/6:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/7
�
�
3__inference_Infrared_Dense_Layer_layer_call_fn_5874

inputs
unknown:	� 
	unknown_0: 
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_Infrared_Dense_Layer_layer_call_and_return_conditional_losses_5034o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:��������� `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
N__inference_Infrared_Dense_Layer_layer_call_and_return_conditional_losses_5034

inputs1
matmul_readvariableop_resource:	� -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	� *
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:��������� Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:��������� w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
0__inference_Third_Dense_Layer_layer_call_fn_5969

inputs
unknown: 
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Third_Dense_Layer_layer_call_and_return_conditional_losses_5112o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:��������� : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:��������� 
 
_user_specified_nameinputs
�
Y
-__inference_Combined_Lidar_layer_call_fn_5838
inputs_0
inputs_1
identity�
PartitionedCallPartitionedCallinputs_0inputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *Q
fLRJ
H__inference_Combined_Lidar_layer_call_and_return_conditional_losses_4984a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������d:����������:Q M
'
_output_shapes
:���������d
"
_user_specified_name
inputs/0:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/1
�

�
L__inference_Second_Dense_Layer_layer_call_and_return_conditional_losses_5960

inputs0
matmul_readvariableop_resource:@ -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@ *
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:��������� Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:��������� w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�=
�
?__inference_model_layer_call_and_return_conditional_losses_5136

inputs
inputs_1
inputs_2
inputs_3
inputs_4
inputs_5
inputs_6
inputs_7+
visible_dense_layer_5018:	� &
visible_dense_layer_5020: ,
infrared_dense_layer_5035:	� '
infrared_dense_layer_5037: )
lidar_dense_layer_5052:	� $
lidar_dense_layer_5054: (
first_dense_layer_5079:`@$
first_dense_layer_5081:@)
second_dense_layer_5096:@ %
second_dense_layer_5098: (
third_dense_layer_5113: $
third_dense_layer_5115:,
mor_and_lwc_estimates_5130:(
mor_and_lwc_estimates_5132:
identity��)First_Dense_Layer/StatefulPartitionedCall�,Infrared_Dense_Layer/StatefulPartitionedCall�)Lidar_Dense_Layer/StatefulPartitionedCall�-MOR_and_LWC_estimates/StatefulPartitionedCall�*Second_Dense_Layer/StatefulPartitionedCall�)Third_Dense_Layer/StatefulPartitionedCall�+Visible_Dense_Layer/StatefulPartitionedCall�
Combined_Lidar/PartitionedCallPartitionedCallinputs_6inputs_7*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *Q
fLRJ
H__inference_Combined_Lidar_layer_call_and_return_conditional_losses_4984�
!Combined_Infrared/PartitionedCallPartitionedCallinputs_3inputs_4inputs_5*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Combined_Infrared_layer_call_and_return_conditional_losses_4994�
 Combined_Visible/PartitionedCallPartitionedCallinputsinputs_1inputs_2*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_Combined_Visible_layer_call_and_return_conditional_losses_5004�
+Visible_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall)Combined_Visible/PartitionedCall:output:0visible_dense_layer_5018visible_dense_layer_5020*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_Visible_Dense_Layer_layer_call_and_return_conditional_losses_5017�
,Infrared_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall*Combined_Infrared/PartitionedCall:output:0infrared_dense_layer_5035infrared_dense_layer_5037*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_Infrared_Dense_Layer_layer_call_and_return_conditional_losses_5034�
)Lidar_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall'Combined_Lidar/PartitionedCall:output:0lidar_dense_layer_5052lidar_dense_layer_5054*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Lidar_Dense_Layer_layer_call_and_return_conditional_losses_5051�
 Combined_Neurons/PartitionedCallPartitionedCall4Visible_Dense_Layer/StatefulPartitionedCall:output:05Infrared_Dense_Layer/StatefulPartitionedCall:output:02Lidar_Dense_Layer/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������`* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_Combined_Neurons_layer_call_and_return_conditional_losses_5065�
)First_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall)Combined_Neurons/PartitionedCall:output:0first_dense_layer_5079first_dense_layer_5081*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_First_Dense_Layer_layer_call_and_return_conditional_losses_5078�
*Second_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall2First_Dense_Layer/StatefulPartitionedCall:output:0second_dense_layer_5096second_dense_layer_5098*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_Second_Dense_Layer_layer_call_and_return_conditional_losses_5095�
)Third_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall3Second_Dense_Layer/StatefulPartitionedCall:output:0third_dense_layer_5113third_dense_layer_5115*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Third_Dense_Layer_layer_call_and_return_conditional_losses_5112�
-MOR_and_LWC_estimates/StatefulPartitionedCallStatefulPartitionedCall2Third_Dense_Layer/StatefulPartitionedCall:output:0mor_and_lwc_estimates_5130mor_and_lwc_estimates_5132*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_MOR_and_LWC_estimates_layer_call_and_return_conditional_losses_5129�
IdentityIdentity6MOR_and_LWC_estimates/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp*^First_Dense_Layer/StatefulPartitionedCall-^Infrared_Dense_Layer/StatefulPartitionedCall*^Lidar_Dense_Layer/StatefulPartitionedCall.^MOR_and_LWC_estimates/StatefulPartitionedCall+^Second_Dense_Layer/StatefulPartitionedCall*^Third_Dense_Layer/StatefulPartitionedCall,^Visible_Dense_Layer/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������:����������:����������:���������:����������:����������:���������d:����������: : : : : : : : : : : : : : 2V
)First_Dense_Layer/StatefulPartitionedCall)First_Dense_Layer/StatefulPartitionedCall2\
,Infrared_Dense_Layer/StatefulPartitionedCall,Infrared_Dense_Layer/StatefulPartitionedCall2V
)Lidar_Dense_Layer/StatefulPartitionedCall)Lidar_Dense_Layer/StatefulPartitionedCall2^
-MOR_and_LWC_estimates/StatefulPartitionedCall-MOR_and_LWC_estimates/StatefulPartitionedCall2X
*Second_Dense_Layer/StatefulPartitionedCall*Second_Dense_Layer/StatefulPartitionedCall2V
)Third_Dense_Layer/StatefulPartitionedCall)Third_Dense_Layer/StatefulPartitionedCall2Z
+Visible_Dense_Layer/StatefulPartitionedCall+Visible_Dense_Layer/StatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs:OK
'
_output_shapes
:���������
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs:OK
'
_output_shapes
:���������d
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

�
K__inference_Third_Dense_Layer_layer_call_and_return_conditional_losses_5980

inputs0
matmul_readvariableop_resource: -
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:���������Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:��������� : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:��������� 
 
_user_specified_nameinputs
�
j
0__inference_Combined_Infrared_layer_call_fn_5824
inputs_0
inputs_1
inputs_2
identity�
PartitionedCallPartitionedCallinputs_0inputs_1inputs_2*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Combined_Infrared_layer_call_and_return_conditional_losses_4994a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:���������:����������:����������:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/1:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/2
�
i
/__inference_Combined_Neurons_layer_call_fn_5912
inputs_0
inputs_1
inputs_2
identity�
PartitionedCallPartitionedCallinputs_0inputs_1inputs_2*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������`* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_Combined_Neurons_layer_call_and_return_conditional_losses_5065`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������`"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:��������� :��������� :��������� :Q M
'
_output_shapes
:��������� 
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:��������� 
"
_user_specified_name
inputs/1:QM
'
_output_shapes
:��������� 
"
_user_specified_name
inputs/2
�

�
O__inference_MOR_and_LWC_estimates_layer_call_and_return_conditional_losses_6000

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
K__inference_First_Dense_Layer_layer_call_and_return_conditional_losses_5940

inputs0
matmul_readvariableop_resource:`@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:`@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:���������@Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������@w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������`: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������`
 
_user_specified_nameinputs
�
�
1__inference_Second_Dense_Layer_layer_call_fn_5949

inputs
unknown:@ 
	unknown_0: 
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_Second_Dense_Layer_layer_call_and_return_conditional_losses_5095o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:��������� `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������@: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
0__inference_Lidar_Dense_Layer_layer_call_fn_5894

inputs
unknown:	� 
	unknown_0: 
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Lidar_Dense_Layer_layer_call_and_return_conditional_losses_5051o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:��������� `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
$__inference_model_layer_call_fn_5438
visible_laplacian_variance
visible_power_spectrum_x
visible_power_spectrum_y
infrared_laplacian_variance
infrared_power_spectrum_x
infrared_power_spectrum_y
lidar_ping_distribution
lidar_depth_map
unknown:	� 
	unknown_0: 
	unknown_1:	� 
	unknown_2: 
	unknown_3:	� 
	unknown_4: 
	unknown_5:`@
	unknown_6:@
	unknown_7:@ 
	unknown_8: 
	unknown_9: 

unknown_10:

unknown_11:

unknown_12:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallvisible_laplacian_variancevisible_power_spectrum_xvisible_power_spectrum_yinfrared_laplacian_varianceinfrared_power_spectrum_xinfrared_power_spectrum_ylidar_ping_distributionlidar_depth_mapunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*!
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *H
fCRA
?__inference_model_layer_call_and_return_conditional_losses_5367o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������:����������:����������:���������:����������:����������:���������d:����������: : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:c _
'
_output_shapes
:���������
4
_user_specified_nameVisible_Laplacian_Variance:b^
(
_output_shapes
:����������
2
_user_specified_nameVisible_Power_Spectrum_X:b^
(
_output_shapes
:����������
2
_user_specified_nameVisible_Power_Spectrum_Y:d`
'
_output_shapes
:���������
5
_user_specified_nameInfrared_Laplacian_Variance:c_
(
_output_shapes
:����������
3
_user_specified_nameInfrared_Power_Spectrum_X:c_
(
_output_shapes
:����������
3
_user_specified_nameInfrared_Power_Spectrum_Y:`\
'
_output_shapes
:���������d
1
_user_specified_nameLidar_Ping_Distribution:YU
(
_output_shapes
:����������
)
_user_specified_nameLidar_Depth_Map
�
i
/__inference_Combined_Visible_layer_call_fn_5809
inputs_0
inputs_1
inputs_2
identity�
PartitionedCallPartitionedCallinputs_0inputs_1inputs_2*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_Combined_Visible_layer_call_and_return_conditional_losses_5004a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:���������:����������:����������:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/1:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/2
�

�
K__inference_Lidar_Dense_Layer_layer_call_and_return_conditional_losses_5905

inputs1
matmul_readvariableop_resource:	� -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	� *
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:��������� Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:��������� w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�k
�
__inference__traced_save_6183
file_prefix9
5savev2_visible_dense_layer_kernel_read_readvariableop7
3savev2_visible_dense_layer_bias_read_readvariableop:
6savev2_infrared_dense_layer_kernel_read_readvariableop8
4savev2_infrared_dense_layer_bias_read_readvariableop7
3savev2_lidar_dense_layer_kernel_read_readvariableop5
1savev2_lidar_dense_layer_bias_read_readvariableop7
3savev2_first_dense_layer_kernel_read_readvariableop5
1savev2_first_dense_layer_bias_read_readvariableop8
4savev2_second_dense_layer_kernel_read_readvariableop6
2savev2_second_dense_layer_bias_read_readvariableop7
3savev2_third_dense_layer_kernel_read_readvariableop5
1savev2_third_dense_layer_bias_read_readvariableop;
7savev2_mor_and_lwc_estimates_kernel_read_readvariableop9
5savev2_mor_and_lwc_estimates_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop@
<savev2_adam_visible_dense_layer_kernel_m_read_readvariableop>
:savev2_adam_visible_dense_layer_bias_m_read_readvariableopA
=savev2_adam_infrared_dense_layer_kernel_m_read_readvariableop?
;savev2_adam_infrared_dense_layer_bias_m_read_readvariableop>
:savev2_adam_lidar_dense_layer_kernel_m_read_readvariableop<
8savev2_adam_lidar_dense_layer_bias_m_read_readvariableop>
:savev2_adam_first_dense_layer_kernel_m_read_readvariableop<
8savev2_adam_first_dense_layer_bias_m_read_readvariableop?
;savev2_adam_second_dense_layer_kernel_m_read_readvariableop=
9savev2_adam_second_dense_layer_bias_m_read_readvariableop>
:savev2_adam_third_dense_layer_kernel_m_read_readvariableop<
8savev2_adam_third_dense_layer_bias_m_read_readvariableopB
>savev2_adam_mor_and_lwc_estimates_kernel_m_read_readvariableop@
<savev2_adam_mor_and_lwc_estimates_bias_m_read_readvariableop@
<savev2_adam_visible_dense_layer_kernel_v_read_readvariableop>
:savev2_adam_visible_dense_layer_bias_v_read_readvariableopA
=savev2_adam_infrared_dense_layer_kernel_v_read_readvariableop?
;savev2_adam_infrared_dense_layer_bias_v_read_readvariableop>
:savev2_adam_lidar_dense_layer_kernel_v_read_readvariableop<
8savev2_adam_lidar_dense_layer_bias_v_read_readvariableop>
:savev2_adam_first_dense_layer_kernel_v_read_readvariableop<
8savev2_adam_first_dense_layer_bias_v_read_readvariableop?
;savev2_adam_second_dense_layer_kernel_v_read_readvariableop=
9savev2_adam_second_dense_layer_bias_v_read_readvariableop>
:savev2_adam_third_dense_layer_kernel_v_read_readvariableop<
8savev2_adam_third_dense_layer_bias_v_read_readvariableopB
>savev2_adam_mor_and_lwc_estimates_kernel_v_read_readvariableop@
<savev2_adam_mor_and_lwc_estimates_bias_v_read_readvariableop
savev2_const

identity_1��MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : �
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: �
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:4*
dtype0*�
value�B�4B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:4*
dtype0*{
valuerBp4B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:05savev2_visible_dense_layer_kernel_read_readvariableop3savev2_visible_dense_layer_bias_read_readvariableop6savev2_infrared_dense_layer_kernel_read_readvariableop4savev2_infrared_dense_layer_bias_read_readvariableop3savev2_lidar_dense_layer_kernel_read_readvariableop1savev2_lidar_dense_layer_bias_read_readvariableop3savev2_first_dense_layer_kernel_read_readvariableop1savev2_first_dense_layer_bias_read_readvariableop4savev2_second_dense_layer_kernel_read_readvariableop2savev2_second_dense_layer_bias_read_readvariableop3savev2_third_dense_layer_kernel_read_readvariableop1savev2_third_dense_layer_bias_read_readvariableop7savev2_mor_and_lwc_estimates_kernel_read_readvariableop5savev2_mor_and_lwc_estimates_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop<savev2_adam_visible_dense_layer_kernel_m_read_readvariableop:savev2_adam_visible_dense_layer_bias_m_read_readvariableop=savev2_adam_infrared_dense_layer_kernel_m_read_readvariableop;savev2_adam_infrared_dense_layer_bias_m_read_readvariableop:savev2_adam_lidar_dense_layer_kernel_m_read_readvariableop8savev2_adam_lidar_dense_layer_bias_m_read_readvariableop:savev2_adam_first_dense_layer_kernel_m_read_readvariableop8savev2_adam_first_dense_layer_bias_m_read_readvariableop;savev2_adam_second_dense_layer_kernel_m_read_readvariableop9savev2_adam_second_dense_layer_bias_m_read_readvariableop:savev2_adam_third_dense_layer_kernel_m_read_readvariableop8savev2_adam_third_dense_layer_bias_m_read_readvariableop>savev2_adam_mor_and_lwc_estimates_kernel_m_read_readvariableop<savev2_adam_mor_and_lwc_estimates_bias_m_read_readvariableop<savev2_adam_visible_dense_layer_kernel_v_read_readvariableop:savev2_adam_visible_dense_layer_bias_v_read_readvariableop=savev2_adam_infrared_dense_layer_kernel_v_read_readvariableop;savev2_adam_infrared_dense_layer_bias_v_read_readvariableop:savev2_adam_lidar_dense_layer_kernel_v_read_readvariableop8savev2_adam_lidar_dense_layer_bias_v_read_readvariableop:savev2_adam_first_dense_layer_kernel_v_read_readvariableop8savev2_adam_first_dense_layer_bias_v_read_readvariableop;savev2_adam_second_dense_layer_kernel_v_read_readvariableop9savev2_adam_second_dense_layer_bias_v_read_readvariableop:savev2_adam_third_dense_layer_kernel_v_read_readvariableop8savev2_adam_third_dense_layer_bias_v_read_readvariableop>savev2_adam_mor_and_lwc_estimates_kernel_v_read_readvariableop<savev2_adam_mor_and_lwc_estimates_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *B
dtypes8
624	�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*�
_input_shapes�
�: :	� : :	� : :	� : :`@:@:@ : : :::: : : : : : : : : :	� : :	� : :	� : :`@:@:@ : : ::::	� : :	� : :	� : :`@:@:@ : : :::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	� : 

_output_shapes
: :%!

_output_shapes
:	� : 

_output_shapes
: :%!

_output_shapes
:	� : 

_output_shapes
: :$ 

_output_shapes

:`@: 

_output_shapes
:@:$	 

_output_shapes

:@ : 


_output_shapes
: :$ 

_output_shapes

: : 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :%!

_output_shapes
:	� : 

_output_shapes
: :%!

_output_shapes
:	� : 

_output_shapes
: :%!

_output_shapes
:	� : 

_output_shapes
: :$ 

_output_shapes

:`@: 

_output_shapes
:@:$  

_output_shapes

:@ : !

_output_shapes
: :$" 

_output_shapes

: : #

_output_shapes
::$$ 

_output_shapes

:: %

_output_shapes
::%&!

_output_shapes
:	� : '

_output_shapes
: :%(!

_output_shapes
:	� : )

_output_shapes
: :%*!

_output_shapes
:	� : +

_output_shapes
: :$, 

_output_shapes

:`@: -

_output_shapes
:@:$. 

_output_shapes

:@ : /

_output_shapes
: :$0 

_output_shapes

: : 1

_output_shapes
::$2 

_output_shapes

:: 3

_output_shapes
::4

_output_shapes
: 
�@
�	
?__inference_model_layer_call_and_return_conditional_losses_5538
visible_laplacian_variance
visible_power_spectrum_x
visible_power_spectrum_y
infrared_laplacian_variance
infrared_power_spectrum_x
infrared_power_spectrum_y
lidar_ping_distribution
lidar_depth_map+
visible_dense_layer_5501:	� &
visible_dense_layer_5503: ,
infrared_dense_layer_5506:	� '
infrared_dense_layer_5508: )
lidar_dense_layer_5511:	� $
lidar_dense_layer_5513: (
first_dense_layer_5517:`@$
first_dense_layer_5519:@)
second_dense_layer_5522:@ %
second_dense_layer_5524: (
third_dense_layer_5527: $
third_dense_layer_5529:,
mor_and_lwc_estimates_5532:(
mor_and_lwc_estimates_5534:
identity��)First_Dense_Layer/StatefulPartitionedCall�,Infrared_Dense_Layer/StatefulPartitionedCall�)Lidar_Dense_Layer/StatefulPartitionedCall�-MOR_and_LWC_estimates/StatefulPartitionedCall�*Second_Dense_Layer/StatefulPartitionedCall�)Third_Dense_Layer/StatefulPartitionedCall�+Visible_Dense_Layer/StatefulPartitionedCall�
Combined_Lidar/PartitionedCallPartitionedCalllidar_ping_distributionlidar_depth_map*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *Q
fLRJ
H__inference_Combined_Lidar_layer_call_and_return_conditional_losses_4984�
!Combined_Infrared/PartitionedCallPartitionedCallinfrared_laplacian_varianceinfrared_power_spectrum_xinfrared_power_spectrum_y*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Combined_Infrared_layer_call_and_return_conditional_losses_4994�
 Combined_Visible/PartitionedCallPartitionedCallvisible_laplacian_variancevisible_power_spectrum_xvisible_power_spectrum_y*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_Combined_Visible_layer_call_and_return_conditional_losses_5004�
+Visible_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall)Combined_Visible/PartitionedCall:output:0visible_dense_layer_5501visible_dense_layer_5503*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_Visible_Dense_Layer_layer_call_and_return_conditional_losses_5017�
,Infrared_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall*Combined_Infrared/PartitionedCall:output:0infrared_dense_layer_5506infrared_dense_layer_5508*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_Infrared_Dense_Layer_layer_call_and_return_conditional_losses_5034�
)Lidar_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall'Combined_Lidar/PartitionedCall:output:0lidar_dense_layer_5511lidar_dense_layer_5513*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Lidar_Dense_Layer_layer_call_and_return_conditional_losses_5051�
 Combined_Neurons/PartitionedCallPartitionedCall4Visible_Dense_Layer/StatefulPartitionedCall:output:05Infrared_Dense_Layer/StatefulPartitionedCall:output:02Lidar_Dense_Layer/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������`* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_Combined_Neurons_layer_call_and_return_conditional_losses_5065�
)First_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall)Combined_Neurons/PartitionedCall:output:0first_dense_layer_5517first_dense_layer_5519*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_First_Dense_Layer_layer_call_and_return_conditional_losses_5078�
*Second_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall2First_Dense_Layer/StatefulPartitionedCall:output:0second_dense_layer_5522second_dense_layer_5524*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_Second_Dense_Layer_layer_call_and_return_conditional_losses_5095�
)Third_Dense_Layer/StatefulPartitionedCallStatefulPartitionedCall3Second_Dense_Layer/StatefulPartitionedCall:output:0third_dense_layer_5527third_dense_layer_5529*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_Third_Dense_Layer_layer_call_and_return_conditional_losses_5112�
-MOR_and_LWC_estimates/StatefulPartitionedCallStatefulPartitionedCall2Third_Dense_Layer/StatefulPartitionedCall:output:0mor_and_lwc_estimates_5532mor_and_lwc_estimates_5534*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_MOR_and_LWC_estimates_layer_call_and_return_conditional_losses_5129�
IdentityIdentity6MOR_and_LWC_estimates/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp*^First_Dense_Layer/StatefulPartitionedCall-^Infrared_Dense_Layer/StatefulPartitionedCall*^Lidar_Dense_Layer/StatefulPartitionedCall.^MOR_and_LWC_estimates/StatefulPartitionedCall+^Second_Dense_Layer/StatefulPartitionedCall*^Third_Dense_Layer/StatefulPartitionedCall,^Visible_Dense_Layer/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*�
_input_shapes�
�:���������:����������:����������:���������:����������:����������:���������d:����������: : : : : : : : : : : : : : 2V
)First_Dense_Layer/StatefulPartitionedCall)First_Dense_Layer/StatefulPartitionedCall2\
,Infrared_Dense_Layer/StatefulPartitionedCall,Infrared_Dense_Layer/StatefulPartitionedCall2V
)Lidar_Dense_Layer/StatefulPartitionedCall)Lidar_Dense_Layer/StatefulPartitionedCall2^
-MOR_and_LWC_estimates/StatefulPartitionedCall-MOR_and_LWC_estimates/StatefulPartitionedCall2X
*Second_Dense_Layer/StatefulPartitionedCall*Second_Dense_Layer/StatefulPartitionedCall2V
)Third_Dense_Layer/StatefulPartitionedCall)Third_Dense_Layer/StatefulPartitionedCall2Z
+Visible_Dense_Layer/StatefulPartitionedCall+Visible_Dense_Layer/StatefulPartitionedCall:c _
'
_output_shapes
:���������
4
_user_specified_nameVisible_Laplacian_Variance:b^
(
_output_shapes
:����������
2
_user_specified_nameVisible_Power_Spectrum_X:b^
(
_output_shapes
:����������
2
_user_specified_nameVisible_Power_Spectrum_Y:d`
'
_output_shapes
:���������
5
_user_specified_nameInfrared_Laplacian_Variance:c_
(
_output_shapes
:����������
3
_user_specified_nameInfrared_Power_Spectrum_X:c_
(
_output_shapes
:����������
3
_user_specified_nameInfrared_Power_Spectrum_Y:`\
'
_output_shapes
:���������d
1
_user_specified_nameLidar_Ping_Distribution:YU
(
_output_shapes
:����������
)
_user_specified_nameLidar_Depth_Map"�L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
c
Infrared_Laplacian_VarianceD
-serving_default_Infrared_Laplacian_Variance:0���������
`
Infrared_Power_Spectrum_XC
+serving_default_Infrared_Power_Spectrum_X:0����������
`
Infrared_Power_Spectrum_YC
+serving_default_Infrared_Power_Spectrum_Y:0����������
L
Lidar_Depth_Map9
!serving_default_Lidar_Depth_Map:0����������
[
Lidar_Ping_Distribution@
)serving_default_Lidar_Ping_Distribution:0���������d
a
Visible_Laplacian_VarianceC
,serving_default_Visible_Laplacian_Variance:0���������
^
Visible_Power_Spectrum_XB
*serving_default_Visible_Power_Spectrum_X:0����������
^
Visible_Power_Spectrum_YB
*serving_default_Visible_Power_Spectrum_Y:0����������I
MOR_and_LWC_estimates0
StatefulPartitionedCall:0���������tensorflow/serving/predict:��
�
layer-0
layer-1
layer-2
layer-3
layer-4
layer-5
layer-6
layer-7
	layer-8

layer-9
layer-10
layer_with_weights-0
layer-11
layer_with_weights-1
layer-12
layer_with_weights-2
layer-13
layer-14
layer_with_weights-3
layer-15
layer_with_weights-4
layer-16
layer_with_weights-5
layer-17
layer_with_weights-6
layer-18
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures"
_tf_keras_network
"
_tf_keras_input_layer
"
_tf_keras_input_layer
"
_tf_keras_input_layer
"
_tf_keras_input_layer
"
_tf_keras_input_layer
"
_tf_keras_input_layer
"
_tf_keras_input_layer
"
_tf_keras_input_layer
�
	variables
trainable_variables
regularization_losses
 	keras_api
!__call__
*"&call_and_return_all_conditional_losses"
_tf_keras_layer
�
#	variables
$trainable_variables
%regularization_losses
&	keras_api
'__call__
*(&call_and_return_all_conditional_losses"
_tf_keras_layer
�
)	variables
*trainable_variables
+regularization_losses
,	keras_api
-__call__
*.&call_and_return_all_conditional_losses"
_tf_keras_layer
�
/	variables
0trainable_variables
1regularization_losses
2	keras_api
3__call__
*4&call_and_return_all_conditional_losses

5kernel
6bias"
_tf_keras_layer
�
7	variables
8trainable_variables
9regularization_losses
:	keras_api
;__call__
*<&call_and_return_all_conditional_losses

=kernel
>bias"
_tf_keras_layer
�
?	variables
@trainable_variables
Aregularization_losses
B	keras_api
C__call__
*D&call_and_return_all_conditional_losses

Ekernel
Fbias"
_tf_keras_layer
�
G	variables
Htrainable_variables
Iregularization_losses
J	keras_api
K__call__
*L&call_and_return_all_conditional_losses"
_tf_keras_layer
�
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
Q__call__
*R&call_and_return_all_conditional_losses

Skernel
Tbias"
_tf_keras_layer
�
U	variables
Vtrainable_variables
Wregularization_losses
X	keras_api
Y__call__
*Z&call_and_return_all_conditional_losses

[kernel
\bias"
_tf_keras_layer
�
]	variables
^trainable_variables
_regularization_losses
`	keras_api
a__call__
*b&call_and_return_all_conditional_losses

ckernel
dbias"
_tf_keras_layer
�
e	variables
ftrainable_variables
gregularization_losses
h	keras_api
i__call__
*j&call_and_return_all_conditional_losses

kkernel
lbias"
_tf_keras_layer
�
50
61
=2
>3
E4
F5
S6
T7
[8
\9
c10
d11
k12
l13"
trackable_list_wrapper
�
50
61
=2
>3
E4
F5
S6
T7
[8
\9
c10
d11
k12
l13"
trackable_list_wrapper
 "
trackable_list_wrapper
�
mnon_trainable_variables

nlayers
ometrics
player_regularization_losses
qlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
rtrace_0
strace_1
ttrace_2
utrace_32�
$__inference_model_layer_call_fn_5167
$__inference_model_layer_call_fn_5626
$__inference_model_layer_call_fn_5666
$__inference_model_layer_call_fn_5438�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 zrtrace_0zstrace_1zttrace_2zutrace_3
�
vtrace_0
wtrace_1
xtrace_2
ytrace_32�
?__inference_model_layer_call_and_return_conditional_losses_5734
?__inference_model_layer_call_and_return_conditional_losses_5802
?__inference_model_layer_call_and_return_conditional_losses_5488
?__inference_model_layer_call_and_return_conditional_losses_5538�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 zvtrace_0zwtrace_1zxtrace_2zytrace_3
�B�
__inference__wrapped_model_4956Visible_Laplacian_VarianceVisible_Power_Spectrum_XVisible_Power_Spectrum_YInfrared_Laplacian_VarianceInfrared_Power_Spectrum_XInfrared_Power_Spectrum_YLidar_Ping_DistributionLidar_Depth_Map"�
���
FullArgSpec
args� 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�
ziter

{beta_1

|beta_2
	}decay
~learning_rate5m�6m�=m�>m�Em�Fm�Sm�Tm�[m�\m�cm�dm�km�lm�5v�6v�=v�>v�Ev�Fv�Sv�Tv�[v�\v�cv�dv�kv�lv�"
	optimizer
,
serving_default"
signature_map
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
!__call__
*"&call_and_return_all_conditional_losses
&""call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
/__inference_Combined_Visible_layer_call_fn_5809�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
J__inference_Combined_Visible_layer_call_and_return_conditional_losses_5817�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
#	variables
$trainable_variables
%regularization_losses
'__call__
*(&call_and_return_all_conditional_losses
&("call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
0__inference_Combined_Infrared_layer_call_fn_5824�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
K__inference_Combined_Infrared_layer_call_and_return_conditional_losses_5832�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
)	variables
*trainable_variables
+regularization_losses
-__call__
*.&call_and_return_all_conditional_losses
&."call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
-__inference_Combined_Lidar_layer_call_fn_5838�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
H__inference_Combined_Lidar_layer_call_and_return_conditional_losses_5845�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.
50
61"
trackable_list_wrapper
.
50
61"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
/	variables
0trainable_variables
1regularization_losses
3__call__
*4&call_and_return_all_conditional_losses
&4"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_Visible_Dense_Layer_layer_call_fn_5854�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_Visible_Dense_Layer_layer_call_and_return_conditional_losses_5865�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
-:+	� 2Visible_Dense_Layer/kernel
&:$ 2Visible_Dense_Layer/bias
.
=0
>1"
trackable_list_wrapper
.
=0
>1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
7	variables
8trainable_variables
9regularization_losses
;__call__
*<&call_and_return_all_conditional_losses
&<"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
3__inference_Infrared_Dense_Layer_layer_call_fn_5874�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
N__inference_Infrared_Dense_Layer_layer_call_and_return_conditional_losses_5885�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.:,	� 2Infrared_Dense_Layer/kernel
':% 2Infrared_Dense_Layer/bias
.
E0
F1"
trackable_list_wrapper
.
E0
F1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
?	variables
@trainable_variables
Aregularization_losses
C__call__
*D&call_and_return_all_conditional_losses
&D"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
0__inference_Lidar_Dense_Layer_layer_call_fn_5894�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
K__inference_Lidar_Dense_Layer_layer_call_and_return_conditional_losses_5905�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
+:)	� 2Lidar_Dense_Layer/kernel
$:" 2Lidar_Dense_Layer/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
G	variables
Htrainable_variables
Iregularization_losses
K__call__
*L&call_and_return_all_conditional_losses
&L"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
/__inference_Combined_Neurons_layer_call_fn_5912�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
J__inference_Combined_Neurons_layer_call_and_return_conditional_losses_5920�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.
S0
T1"
trackable_list_wrapper
.
S0
T1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
M	variables
Ntrainable_variables
Oregularization_losses
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
0__inference_First_Dense_Layer_layer_call_fn_5929�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
K__inference_First_Dense_Layer_layer_call_and_return_conditional_losses_5940�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
*:(`@2First_Dense_Layer/kernel
$:"@2First_Dense_Layer/bias
.
[0
\1"
trackable_list_wrapper
.
[0
\1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
U	variables
Vtrainable_variables
Wregularization_losses
Y__call__
*Z&call_and_return_all_conditional_losses
&Z"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
1__inference_Second_Dense_Layer_layer_call_fn_5949�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
L__inference_Second_Dense_Layer_layer_call_and_return_conditional_losses_5960�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
+:)@ 2Second_Dense_Layer/kernel
%:# 2Second_Dense_Layer/bias
.
c0
d1"
trackable_list_wrapper
.
c0
d1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
]	variables
^trainable_variables
_regularization_losses
a__call__
*b&call_and_return_all_conditional_losses
&b"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
0__inference_Third_Dense_Layer_layer_call_fn_5969�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
K__inference_Third_Dense_Layer_layer_call_and_return_conditional_losses_5980�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
*:( 2Third_Dense_Layer/kernel
$:"2Third_Dense_Layer/bias
.
k0
l1"
trackable_list_wrapper
.
k0
l1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
e	variables
ftrainable_variables
gregularization_losses
i__call__
*j&call_and_return_all_conditional_losses
&j"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
4__inference_MOR_and_LWC_estimates_layer_call_fn_5989�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
O__inference_MOR_and_LWC_estimates_layer_call_and_return_conditional_losses_6000�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.:,2MOR_and_LWC_estimates/kernel
(:&2MOR_and_LWC_estimates/bias
 "
trackable_list_wrapper
�
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15
16
17
18"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
$__inference_model_layer_call_fn_5167Visible_Laplacian_VarianceVisible_Power_Spectrum_XVisible_Power_Spectrum_YInfrared_Laplacian_VarianceInfrared_Power_Spectrum_XInfrared_Power_Spectrum_YLidar_Ping_DistributionLidar_Depth_Map"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
$__inference_model_layer_call_fn_5626inputs/0inputs/1inputs/2inputs/3inputs/4inputs/5inputs/6inputs/7"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
$__inference_model_layer_call_fn_5666inputs/0inputs/1inputs/2inputs/3inputs/4inputs/5inputs/6inputs/7"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
$__inference_model_layer_call_fn_5438Visible_Laplacian_VarianceVisible_Power_Spectrum_XVisible_Power_Spectrum_YInfrared_Laplacian_VarianceInfrared_Power_Spectrum_XInfrared_Power_Spectrum_YLidar_Ping_DistributionLidar_Depth_Map"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
?__inference_model_layer_call_and_return_conditional_losses_5734inputs/0inputs/1inputs/2inputs/3inputs/4inputs/5inputs/6inputs/7"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
?__inference_model_layer_call_and_return_conditional_losses_5802inputs/0inputs/1inputs/2inputs/3inputs/4inputs/5inputs/6inputs/7"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
?__inference_model_layer_call_and_return_conditional_losses_5488Visible_Laplacian_VarianceVisible_Power_Spectrum_XVisible_Power_Spectrum_YInfrared_Laplacian_VarianceInfrared_Power_Spectrum_XInfrared_Power_Spectrum_YLidar_Ping_DistributionLidar_Depth_Map"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
?__inference_model_layer_call_and_return_conditional_losses_5538Visible_Laplacian_VarianceVisible_Power_Spectrum_XVisible_Power_Spectrum_YInfrared_Laplacian_VarianceInfrared_Power_Spectrum_XInfrared_Power_Spectrum_YLidar_Ping_DistributionLidar_Depth_Map"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
�B�
"__inference_signature_wrapper_5586Infrared_Laplacian_VarianceInfrared_Power_Spectrum_XInfrared_Power_Spectrum_YLidar_Depth_MapLidar_Ping_DistributionVisible_Laplacian_VarianceVisible_Power_Spectrum_XVisible_Power_Spectrum_Y"�
���
FullArgSpec
args� 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
/__inference_Combined_Visible_layer_call_fn_5809inputs/0inputs/1inputs/2"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
J__inference_Combined_Visible_layer_call_and_return_conditional_losses_5817inputs/0inputs/1inputs/2"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_Combined_Infrared_layer_call_fn_5824inputs/0inputs/1inputs/2"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_Combined_Infrared_layer_call_and_return_conditional_losses_5832inputs/0inputs/1inputs/2"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
-__inference_Combined_Lidar_layer_call_fn_5838inputs/0inputs/1"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
H__inference_Combined_Lidar_layer_call_and_return_conditional_losses_5845inputs/0inputs/1"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_Visible_Dense_Layer_layer_call_fn_5854inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_Visible_Dense_Layer_layer_call_and_return_conditional_losses_5865inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
3__inference_Infrared_Dense_Layer_layer_call_fn_5874inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
N__inference_Infrared_Dense_Layer_layer_call_and_return_conditional_losses_5885inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_Lidar_Dense_Layer_layer_call_fn_5894inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_Lidar_Dense_Layer_layer_call_and_return_conditional_losses_5905inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
/__inference_Combined_Neurons_layer_call_fn_5912inputs/0inputs/1inputs/2"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
J__inference_Combined_Neurons_layer_call_and_return_conditional_losses_5920inputs/0inputs/1inputs/2"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_First_Dense_Layer_layer_call_fn_5929inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_First_Dense_Layer_layer_call_and_return_conditional_losses_5940inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
1__inference_Second_Dense_Layer_layer_call_fn_5949inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
L__inference_Second_Dense_Layer_layer_call_and_return_conditional_losses_5960inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_Third_Dense_Layer_layer_call_fn_5969inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_Third_Dense_Layer_layer_call_and_return_conditional_losses_5980inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
4__inference_MOR_and_LWC_estimates_layer_call_fn_5989inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
O__inference_MOR_and_LWC_estimates_layer_call_and_return_conditional_losses_6000inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
R
�	variables
�	keras_api

�total

�count"
_tf_keras_metric
c
�	variables
�	keras_api

�total

�count
�
_fn_kwargs"
_tf_keras_metric
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
:  (2total
:  (2count
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
2:0	� 2!Adam/Visible_Dense_Layer/kernel/m
+:) 2Adam/Visible_Dense_Layer/bias/m
3:1	� 2"Adam/Infrared_Dense_Layer/kernel/m
,:* 2 Adam/Infrared_Dense_Layer/bias/m
0:.	� 2Adam/Lidar_Dense_Layer/kernel/m
):' 2Adam/Lidar_Dense_Layer/bias/m
/:-`@2Adam/First_Dense_Layer/kernel/m
):'@2Adam/First_Dense_Layer/bias/m
0:.@ 2 Adam/Second_Dense_Layer/kernel/m
*:( 2Adam/Second_Dense_Layer/bias/m
/:- 2Adam/Third_Dense_Layer/kernel/m
):'2Adam/Third_Dense_Layer/bias/m
3:12#Adam/MOR_and_LWC_estimates/kernel/m
-:+2!Adam/MOR_and_LWC_estimates/bias/m
2:0	� 2!Adam/Visible_Dense_Layer/kernel/v
+:) 2Adam/Visible_Dense_Layer/bias/v
3:1	� 2"Adam/Infrared_Dense_Layer/kernel/v
,:* 2 Adam/Infrared_Dense_Layer/bias/v
0:.	� 2Adam/Lidar_Dense_Layer/kernel/v
):' 2Adam/Lidar_Dense_Layer/bias/v
/:-`@2Adam/First_Dense_Layer/kernel/v
):'@2Adam/First_Dense_Layer/bias/v
0:.@ 2 Adam/Second_Dense_Layer/kernel/v
*:( 2Adam/Second_Dense_Layer/bias/v
/:- 2Adam/Third_Dense_Layer/kernel/v
):'2Adam/Third_Dense_Layer/bias/v
3:12#Adam/MOR_and_LWC_estimates/kernel/v
-:+2!Adam/MOR_and_LWC_estimates/bias/v�
K__inference_Combined_Infrared_layer_call_and_return_conditional_losses_5832���}
v�s
q�n
"�
inputs/0���������
#� 
inputs/1����������
#� 
inputs/2����������
� "&�#
�
0����������
� �
0__inference_Combined_Infrared_layer_call_fn_5824���}
v�s
q�n
"�
inputs/0���������
#� 
inputs/1����������
#� 
inputs/2����������
� "������������
H__inference_Combined_Lidar_layer_call_and_return_conditional_losses_5845�[�X
Q�N
L�I
"�
inputs/0���������d
#� 
inputs/1����������
� "&�#
�
0����������
� �
-__inference_Combined_Lidar_layer_call_fn_5838x[�X
Q�N
L�I
"�
inputs/0���������d
#� 
inputs/1����������
� "������������
J__inference_Combined_Neurons_layer_call_and_return_conditional_losses_5920�~�{
t�q
o�l
"�
inputs/0��������� 
"�
inputs/1��������� 
"�
inputs/2��������� 
� "%�"
�
0���������`
� �
/__inference_Combined_Neurons_layer_call_fn_5912�~�{
t�q
o�l
"�
inputs/0��������� 
"�
inputs/1��������� 
"�
inputs/2��������� 
� "����������`�
J__inference_Combined_Visible_layer_call_and_return_conditional_losses_5817���}
v�s
q�n
"�
inputs/0���������
#� 
inputs/1����������
#� 
inputs/2����������
� "&�#
�
0����������
� �
/__inference_Combined_Visible_layer_call_fn_5809���}
v�s
q�n
"�
inputs/0���������
#� 
inputs/1����������
#� 
inputs/2����������
� "������������
K__inference_First_Dense_Layer_layer_call_and_return_conditional_losses_5940\ST/�,
%�"
 �
inputs���������`
� "%�"
�
0���������@
� �
0__inference_First_Dense_Layer_layer_call_fn_5929OST/�,
%�"
 �
inputs���������`
� "����������@�
N__inference_Infrared_Dense_Layer_layer_call_and_return_conditional_losses_5885]=>0�-
&�#
!�
inputs����������
� "%�"
�
0��������� 
� �
3__inference_Infrared_Dense_Layer_layer_call_fn_5874P=>0�-
&�#
!�
inputs����������
� "���������� �
K__inference_Lidar_Dense_Layer_layer_call_and_return_conditional_losses_5905]EF0�-
&�#
!�
inputs����������
� "%�"
�
0��������� 
� �
0__inference_Lidar_Dense_Layer_layer_call_fn_5894PEF0�-
&�#
!�
inputs����������
� "���������� �
O__inference_MOR_and_LWC_estimates_layer_call_and_return_conditional_losses_6000\kl/�,
%�"
 �
inputs���������
� "%�"
�
0���������
� �
4__inference_MOR_and_LWC_estimates_layer_call_fn_5989Okl/�,
%�"
 �
inputs���������
� "�����������
L__inference_Second_Dense_Layer_layer_call_and_return_conditional_losses_5960\[\/�,
%�"
 �
inputs���������@
� "%�"
�
0��������� 
� �
1__inference_Second_Dense_Layer_layer_call_fn_5949O[\/�,
%�"
 �
inputs���������@
� "���������� �
K__inference_Third_Dense_Layer_layer_call_and_return_conditional_losses_5980\cd/�,
%�"
 �
inputs��������� 
� "%�"
�
0���������
� �
0__inference_Third_Dense_Layer_layer_call_fn_5969Ocd/�,
%�"
 �
inputs��������� 
� "�����������
M__inference_Visible_Dense_Layer_layer_call_and_return_conditional_losses_5865]560�-
&�#
!�
inputs����������
� "%�"
�
0��������� 
� �
2__inference_Visible_Dense_Layer_layer_call_fn_5854P560�-
&�#
!�
inputs����������
� "���������� �
__inference__wrapped_model_4956�56=>EFST[\cdkl���
���
���
4�1
Visible_Laplacian_Variance���������
3�0
Visible_Power_Spectrum_X����������
3�0
Visible_Power_Spectrum_Y����������
5�2
Infrared_Laplacian_Variance���������
4�1
Infrared_Power_Spectrum_X����������
4�1
Infrared_Power_Spectrum_Y����������
1�.
Lidar_Ping_Distribution���������d
*�'
Lidar_Depth_Map����������
� "M�J
H
MOR_and_LWC_estimates/�,
MOR_and_LWC_estimates����������
?__inference_model_layer_call_and_return_conditional_losses_5488�56=>EFST[\cdkl���
���
���
4�1
Visible_Laplacian_Variance���������
3�0
Visible_Power_Spectrum_X����������
3�0
Visible_Power_Spectrum_Y����������
5�2
Infrared_Laplacian_Variance���������
4�1
Infrared_Power_Spectrum_X����������
4�1
Infrared_Power_Spectrum_Y����������
1�.
Lidar_Ping_Distribution���������d
*�'
Lidar_Depth_Map����������
p 

 
� "%�"
�
0���������
� �
?__inference_model_layer_call_and_return_conditional_losses_5538�56=>EFST[\cdkl���
���
���
4�1
Visible_Laplacian_Variance���������
3�0
Visible_Power_Spectrum_X����������
3�0
Visible_Power_Spectrum_Y����������
5�2
Infrared_Laplacian_Variance���������
4�1
Infrared_Power_Spectrum_X����������
4�1
Infrared_Power_Spectrum_Y����������
1�.
Lidar_Ping_Distribution���������d
*�'
Lidar_Depth_Map����������
p

 
� "%�"
�
0���������
� �
?__inference_model_layer_call_and_return_conditional_losses_5734�56=>EFST[\cdkl���
���
���
"�
inputs/0���������
#� 
inputs/1����������
#� 
inputs/2����������
"�
inputs/3���������
#� 
inputs/4����������
#� 
inputs/5����������
"�
inputs/6���������d
#� 
inputs/7����������
p 

 
� "%�"
�
0���������
� �
?__inference_model_layer_call_and_return_conditional_losses_5802�56=>EFST[\cdkl���
���
���
"�
inputs/0���������
#� 
inputs/1����������
#� 
inputs/2����������
"�
inputs/3���������
#� 
inputs/4����������
#� 
inputs/5����������
"�
inputs/6���������d
#� 
inputs/7����������
p

 
� "%�"
�
0���������
� �
$__inference_model_layer_call_fn_5167�56=>EFST[\cdkl���
���
���
4�1
Visible_Laplacian_Variance���������
3�0
Visible_Power_Spectrum_X����������
3�0
Visible_Power_Spectrum_Y����������
5�2
Infrared_Laplacian_Variance���������
4�1
Infrared_Power_Spectrum_X����������
4�1
Infrared_Power_Spectrum_Y����������
1�.
Lidar_Ping_Distribution���������d
*�'
Lidar_Depth_Map����������
p 

 
� "�����������
$__inference_model_layer_call_fn_5438�56=>EFST[\cdkl���
���
���
4�1
Visible_Laplacian_Variance���������
3�0
Visible_Power_Spectrum_X����������
3�0
Visible_Power_Spectrum_Y����������
5�2
Infrared_Laplacian_Variance���������
4�1
Infrared_Power_Spectrum_X����������
4�1
Infrared_Power_Spectrum_Y����������
1�.
Lidar_Ping_Distribution���������d
*�'
Lidar_Depth_Map����������
p

 
� "�����������
$__inference_model_layer_call_fn_5626�56=>EFST[\cdkl���
���
���
"�
inputs/0���������
#� 
inputs/1����������
#� 
inputs/2����������
"�
inputs/3���������
#� 
inputs/4����������
#� 
inputs/5����������
"�
inputs/6���������d
#� 
inputs/7����������
p 

 
� "�����������
$__inference_model_layer_call_fn_5666�56=>EFST[\cdkl���
���
���
"�
inputs/0���������
#� 
inputs/1����������
#� 
inputs/2����������
"�
inputs/3���������
#� 
inputs/4����������
#� 
inputs/5����������
"�
inputs/6���������d
#� 
inputs/7����������
p

 
� "�����������
"__inference_signature_wrapper_5586�56=>EFST[\cdkl���
� 
���
T
Infrared_Laplacian_Variance5�2
Infrared_Laplacian_Variance���������
Q
Infrared_Power_Spectrum_X4�1
Infrared_Power_Spectrum_X����������
Q
Infrared_Power_Spectrum_Y4�1
Infrared_Power_Spectrum_Y����������
=
Lidar_Depth_Map*�'
Lidar_Depth_Map����������
L
Lidar_Ping_Distribution1�.
Lidar_Ping_Distribution���������d
R
Visible_Laplacian_Variance4�1
Visible_Laplacian_Variance���������
O
Visible_Power_Spectrum_X3�0
Visible_Power_Spectrum_X����������
O
Visible_Power_Spectrum_Y3�0
Visible_Power_Spectrum_Y����������"M�J
H
MOR_and_LWC_estimates/�,
MOR_and_LWC_estimates���������
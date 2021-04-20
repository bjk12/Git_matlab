# Git_matlab
基于 matlab 的一些算法验证和仿真
<br>

![BJK_logo icon](https://github.com/bjk12/LittleBird_TypeExercise/blob/main/bjk1.ico)  
## 目录
* [current_test](#current_test)
  * [DBSCANdemo.m](#dbscandemo)
  * [Nasen.m](#nasen)
  * [SDFT.m](#sdft)
  * [WakeSleep.m](#wakesleep算法)
  * [bjk_lqr.m](#bjk_lqr)
  * [figure3Dtest.m](#figure3dtest)
  * [sir.m](#sir)
  * [sirrun2.m](#sirrun2)
* [signal_fft](#signal_fft)

## current_test
**current_test** 文件夹，保存着复现各种算法的代码<br>
### DBSCANdemo
DBSCAN(Density-Based Spatial Clustering of Applications with Noise)**基于密度的聚类算法**。<br>
具体步骤：
1. DBScan需要二个参数： 扫描半径 (eps)和最小包含点数(minPts)。 任选一个未被访问(unvisited)的点开始，找出与其距离在eps之内(包括eps)的所有附近点。<br>
2. 如果 附近点的数量 ≥ minPts，则当前点与其附近点形成一个簇，并且出发点被标记为已访问(visited)。 然后递归，以相同的方法处理该簇内所有未被标记为已访问(visited)的点，从而对簇进行扩展；
如果 附近点的数量 < minPts，则该点暂时被标记作为噪声点。<br>
3. 如果簇充分地被扩展，即簇内的所有点被标记为已访问，然后用同样的算法去处理未被访问的点。<br>

### Nasen
纳什平衡——硬币案例的复现代码
### SDFT
**滑动DFT**算法复现<br>
优势：
1. 高效，每输入一个时域信号就更新一次频域信息，特别适合对长时间连续的时域数据流进行N点dft；<br>
2. 灵活，可以选择性地只求解频域的前n个点,进一步减少数据计算量，提高数据处理效率；<br>
3. 简单，三行代码即可搞定，同复杂的基2fft相比，可谓是傻瓜式算法。<br>
### WakeSleep算法
Hinton大神为了求解置信神经网络的后验概率所设计的醒眠算法的伪代码，思想理解了，复现就、就有点难度，溜了溜了~<br>

![pic4_wake_sleep](https://github.com/bjk12/Git_matlab/current_test/dbn_ws_updownAlgorithm.png)<br>
### bjk_lqr
LQR(linear quadratic regulator)线性二次型调节器,基于MATLAB代码测试
### figure3Dtest
基于MATLAB绘制3D图的测试文件
### sir
经典传染病模型SIR的算法测试（建立模型，通过三个微分公式表示三类人群数量随时间变化的趋势）
### sirrun2
经典传染病模型SIR的算法测试（根据模型，即微分公式，求解各类人群数量的变化曲线）
## signal_fft
**signal_fft** 文件夹，保存着基于MATLAB对数据进行fft，并绘图显示的例程代码。<br>

其中：<br>
**data_1000HZ.txt：** 保存原始数据；<br>
**bjk_readtext.m：** 从.txt文件中读取数据，然后另存为方便读取的.mat文件；<br>
**bjk_fft.m：** 从.mat文件中读取数据，然后对数据fft并绘制成图；<br>
**real_data.mat：** .txt文件中的数据被另存到了这里；<br>

未完待续

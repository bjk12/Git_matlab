# Git_matlab
基于 matlab 的一些算法验证和仿真
<br>

![BJK_logo icon](https://github.com/bjk12/LittleBird_TypeExercise/blob/main/bjk1.ico)  
## 目录
* [ModelingCompetition](#ModelingCompetition)
  * [2019_1837_A](#2019_1837_A)
  * [2020_1517_D](#2020_1517_D)
  * [从剪刀石头布说开去](#从剪刀石头布说开去)
* [current_test](#current_test)
  * [DBSCANdemo.m](#DBSCANdemo)
  * [Nasen.m](#nasen)
  * [SDFT.m](#sdft)
  * [WakeSleep.m](#WakeSleep算法)
  * [bjk_lqr.m](#bjk_lqr)
  * [figure3Dtest.m](#figure3dtest)
  * [sir.m](#sir)
  * [sirrun2.m](#sirrun2)
* [signal_fft](#signal_fft)

## ModelingCompetition
**ModelingCompetition** 文件夹，保存着建模比赛时基于matlab的代码。<br>

### 2019_1837_A
&#8195;&#8195;19年的小美赛A题，拿了特等奖（OutStanding Winner），清酒珍馐，以慰风尘。一带二是真的辛苦 ( ´•︵•` ) ，从此不再参加建模比赛。<br>

&#8195;&#8195;言归正传，这次的题目是给定辐射曲线，要求为辐射物找到一个最佳形状令辐射物辐射到外界的能量最小。<br>

&#8195;&#8195;**ps:2021年4月13日，日本政府正式决定将福岛第一核电站上百万吨核污染水排入大海。**<br>

&#8195;&#8195;我们该记住这一天。<br>

&#8195;&#8195;用人话说就是，我用核燃料发电会产生核废料，体积不大但需要用深埋或者特殊材料封装起来才行，即使这样我依旧担心包裹核废料的外壳能不能承受住来自核废料这一“万年恶灵”永无止境的的辐射轰击。于是我自然而然地想到一个问题：“既然辐射不可避免，那存不存在一种形状，可以在核废料体积相同的情况下，使这种形状的核废料将大部分能量辐射到自身，辐射到外界（外壳）中的能量最少呢？”<br>

&#8195;&#8195;思路：从给定辐射曲线中抽象出辐射模型来，然后生成模型加贪婪算法，让这个最优形状一点点“长”出来。<br>
&#8195;&#8195;结论：根据仿真结果推断，最优形状极有可能是个空心多孔球（参考动漫里奶酪的结构）。<br>
&#8195;&#8195;缺点：显然，仿真体积越大，结果越真实可信。但随着体积的增大，计算量和所需内存也在立方级地增加。在算力和内存一定的前提下，想提升预测精度就会变得相当耗时，甚至不可行。<br>

### 2020_1517_D
&#8195;&#8195;20年的小美赛D题，二等奖，这次没参加，只是辅导其他同学。那不忍直视的论文，可惜了我的算法和代码。明明单论思想和有趣程度，我都觉得这次比19年那次做得更好。<br>

&#8195;&#8195;等啥时候有空把这篇论文展开讲讲，标题我都想好了，就叫《**从剪刀石头布说开去——非合作博弈中的N个角色实现平衡的一种方法及其鲁棒性分析**》<br>

### 从剪刀石头布说开去

&#8195;&#8195;**——非合作博弈中的N个角色实现平衡的一种方法及其鲁棒性分析**<br>

&#8195;&#8195;**此处未完待续**<br>

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
<div align=center><img src="https://github.com/bjk12/Git_matlab/blob/main/current_test/dbn_ws_updownAlgorithm.png" width="50%" height="150%" alt="pic4_readme"/></div><br>

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

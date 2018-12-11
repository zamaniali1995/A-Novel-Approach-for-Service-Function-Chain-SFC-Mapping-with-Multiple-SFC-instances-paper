%Author: Ali Zamani
%Email: zamaniali1995@gmail.com
FunNum=6; %Number of functions
%////////////////////////////////////////////////////////////////////////
% 
Chains=zeros(1,FunNum);

%///////////////////////////////////////////////////////////////////////
Ic=6;  %%Number of instances for SC c
M=1;   %%Max number of specific functions in each nodes
Rf=100;  %%Max number of each functions in the netwok
K=5;   %%Max number of NFV nodes
woutcom=[0 0 0 1 1 0 0 1 0 0 0 0 1 0;
        0 0 1 0 0 0 1 0 0 0 0 1 0 0;
        1 0 0 0 0 0 0 0 1 0 0 0 0 0;
        0 1 0 0 0 0 0 0 0 1 1 0 0 0;
        0 0 0 0 0 1 0 0 0 0 0 0 0 1]; %%incoming and outcoming links to the nodes
wincom=[1 0 0 0 0 1 0 0 0 0 1 1 0 0;
         0 0 0 0 1 0 0 0 0 1 0 0 0 1;
         0 1 0 0 0 0 0 1 0 0 0 0 0 0;
         0 0 1 1 0 0 0 0 1 0 0 0 0 0;
         0 0 0 0 0 0 1 0 0 0 0 0 1 0]; %%outcoming and outcoming links to the nodes
ChainNum=1;   %%Number of chains
SourceNum=4; %Cloud is not considered as a source
NumLink=14; %Number of links(income+outcome)
delay=[1 1 1 2 1 3 3 1 1 1 2 1 3 3];%Latency of links
CAP=[10 10 10 10 10 100 100 10 10 10 10 10 100 100]; %Capacity of links
% Dsd=zeros(SourceNum,DestinationNum,1);
%f=NumFunInEachChain(c,FunNum); %%Number of functions in each chains
%f(1,C)=5; %%Number of functions in each chains
V=5;  %%Number of nodes in network topology
ncore=[10 10 10 10 10000];  %%Core number of each node
% SDNum=10000; %%Number of source-destinations
% TopoNum=10; %%Number of topologies
DestinationNum=5;
% savefile=['Data1';'Data2'];
% savefile1=['Data1';'Data2';'Data3';'Data4';'Data5';'Data6';'Data7';'Data8';'Data9'];
% savefile2=['Data10';'Data11';'Data12';'Data13';'Data14';'Data15';'Data16';'Data17';
%            'Data18';'Data19'];
% savefile3=['Data20';'Data21';'Data22';'Data23';'Data24';'Data25';'Data26';'Data27';
%            'Data28';'Data29'];  
% savefile4=['Data30';'Data31';'Data32';'Data33';'Data34';'Data35';'Data36';'Data37';'Data38';'Data39';];        
% savefile5=['Data40';'Data41';'Data42';'Data43';'Data44';'Data45';'Data46';'Data47';'Data48';'Data49'];
% savefile6=['Data50';'Data51';'Data52';'Data53';'Data54';'Data55';'Data56';'Data57';'Data58';'Data59']; 
% savefile7=['Data60';'Data61';'Data62';'Data63';'Data64';'Data65';'Data66';'Data67';'Data68';'Data69']; 
% savefile8=['Data70';'Data71';'Data72';'Data73';'Data74';'Data75';'Data76';'Data77';'Data78';'Data79'];    
% savefile9=['Data80';'Data81';'Data82';'Data83';'Data84';'Data85';'Data86';'Data87';'Data88';'Data89']; 
% savefile10=['Data90';'Data91';'Data92';'Data93';'Data94';'Data95';'Data96';'Data97';'Data98';'Data99']; 
% savefile11=['Data100';'Data101';'Data102';'Data103';'Data104';'Data105';'Data106'];        
 
          

          
  
% savefile=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','-','+','@','!','$','%','^','&','*','(',')','_','=','~','}','{','?','>','<','\','/'];
%////////////////////////////////////////////////////////////////////////


for i=1:1
clc,clear a b Delta Dsd SD,close all

Var=Chains;
% while Var==Chains
[Dsd,SD,Tfi,nf,Chains,SLA,nc]=DefineChain(ChainNum,FunNum,SourceNum,DestinationNum);
% end
[Delta,b,a,TopoNum]=DefineTopologies(Chains,V,FunNum,ChainNum,SD,SourceNum,DestinationNum,NumLink);


%//////////////////////////////////////////////////////////////////////////
F=objectivefunction(delay,Delta,b,TopoNum,SourceNum,DestinationNum,NumLink,FunNum,V,SD);
% % if i<10
%     save(savefile1(i,:),'a','b','Delta','SD','Chains', 'Dsd','Cnt','F');
% elseif i<20
%     save(savefile2(i-9,:),'a','b','Delta','SD','Chains', 'Dsd','Cnt','F');
% elseif i<30
%     save(savefile3(i-19,:),'a','b','Delta','SD','Chains', 'Dsd','Cnt','F');
% elseif i<40
%     save(savefile4(i-29,:),'a','b','Delta','SD','Chains', 'Dsd','Cnt','F');
% elseif i<50
%     save(savefile5(i-39,:),'a','b','Delta','SD','Chains', 'Dsd','Cnt','F');
% elseif i<60
%     save(savefile6(i-49,:),'a','b','Delta','SD','Chains', 'Dsd','Cnt','F');
% elseif i<70
%     save(savefile7(i-59,:),'a','b','Delta','SD','Chains', 'Dsd','Cnt','F');
% elseif i<80
%     save(savefile8(i-69,:),'a','b','Delta','SD','Chains', 'Dsd','Cnt','F');
% elseif i<90
%     save(savefile9(i-79,:),'a','b','Delta','SD','Chains', 'Dsd','Cnt','F');
% elseif i<100
%     save(savefile10(i-89,:),'a','b','Delta','SD','Chains', 'Dsd','Cnt','F');
% end                                    
end
Fog_delay=zeros(1,1);
cloud_delay1=zeros(1,1);
AWS1=zeros(1,1);
Core_used=zeros(1,1);
for i=1:7
    Ic=i;
[VarNum,~]=size(F);
[A,B,Aeq,Beq]=DefineConstraints(Ic,M,a,Tfi,Rf,K,FunNum,V,Delta,b,ChainNum,TopoNum,nf,ncore,SD,Dsd,SourceNum,DestinationNum,NumLink,CAP,delay,SLA,nc,wincom,woutcom); 
intcon =1:VarNum;
% A1=zeros(1,602);
% B1=0;
Aeq1=zeros(1,VarNum);
Beq1=0;
lb = zeros(VarNum,1);
ub = ones(VarNum,1);
x = intlinprog(F,intcon,A,B,Aeq,Beq,lb,ub);
cloud_delay=cloudscenario(SD,SourceNum,DestinationNum);
AWS=AWSCal(SD,SourceNum,DestinationNum);
su=0;
for j=1:VarNum
    if x(j,1)~=0
        su=su+F(j,1);
    end
end
Fog_delay(1,i)=su;
cloud_delay1(1,i)=cloud_delay;
AWS1(1,i)=AWS;
su=0;
for j=(TopoNum+1):(TopoNum+(FunNum*V))
            su=su+x(j,1);      
end
Core_used(1,i)=su;
end

% save(??'a','Fog_delay','cloud_delay1','AWS1','Cor_used','x');
save('1','Fog_delay','cloud_delay1','AWS1','Core_used','x');
% axis([1 4 0 cloud_delay+3])
% title('Overal end-to-end delay')
% xlabel('Number of Instances'); 
% ylabel('Overal Delay of Network');
% p=plot([1 2 3 4],Fog_delay,[1 2 3 4], cloud_delay1,[1 2 3 4],AWS1);
% axis([1 4 0 cloud_delay+15])
% p(1).Color='b';
% p(1).LineStyle='--';
% p(1).LineWidth=2;
% p(1).Marker='*';
% p(1).MarkerSize=10;
% p(1).MarkerEdgeColor='b';
% p(1).MarkerFaceColor='b';
% 
% p(2).Color='k';
% p(2).LineStyle='-.';
% p(2).LineWidth=2;
% p(2).Marker='s';
% p(2).MarkerSize=10;
% p(2).MarkerEdgeColor='k';
% p(2).MarkerFaceColor='k';
% 
% p(3).Color='r';
% p(3).LineStyle=':';
% p(3).LineWidth=2;
% p(3).Marker='o';
% p(3).MarkerSize=10;
% p(3).MarkerEdgeColor='r';
% legend('F2C','Cloud','ASP');
% % ['--bs','LineWidth',2 ,'Marker','*','MarkerSize',10,'MarkerEdgeColor','b', 'MarkerFaceColor','k'];
% plot(ax1,cloud_delay1)
% plot(ax1,AWS1)
% title(ax1,'Overal end-to-end delay')
% plot(Fog_delay,'--bs','LineWidth',2 ,'Marker','*','MarkerSize',10,'MarkerEdgeColor','b', 'MarkerFaceColor','k');
% plot(cloud_delay1,'-.ks','LineWidth',2 ,'MarkerSize',10,'MarkerEdgeColor','k', 'MarkerFaceColor','k'); 
% plot(AWS1,':rs','LineWidth',2,'Marker','o', 'MarkerSize',10,'MarkerEdgeColor','r'); 

% hold
% axis([1 4 0 10])
% title('Used Core')
% xlabel('Number of Instances'); 
% ylabel('Number of Used Core');
% plot(Cor_used,'--bs','LineWidth',2 ,'Marker','*','MarkerSize',10,'MarkerEdgeColor','b', 'MarkerFaceColor','k');
% hold
% ax1 = subplot(1,2,1); % top subplot
% x = linspace(0,3);
% y1 = sin(5*x);
% p=plot(ax1,[1 2 3 4],Fog_delay,[1 2 3 4], cloud_delay1,[1 2 3 4],AWS1);
% axis([1 4 0 cloud_delay+15])
% p(1).Color='b';
% p(1).LineStyle='--';
% p(1).LineWidth=2;
% p(1).Marker='*';
% p(1).MarkerSize=10;
% p(1).MarkerEdgeColor='b';
% p(1).MarkerFaceColor='b';
% 
% p(2).Color='k';
% p(2).LineStyle='-.';
% p(2).LineWidth=2;
% p(2).Marker='s';
% p(2).MarkerSize=10;
% p(2).MarkerEdgeColor='k';
% p(2).MarkerFaceColor='k';
% 
% p(3).Color='r';
% p(3).LineStyle=':';
% p(3).LineWidth=2;
% p(3).Marker='o';
% p(3).MarkerSize=10;
% p(3).MarkerEdgeColor='r';
% legend('F2C','Cloud','ASP');
% % ['--bs','LineWidth',2 ,'Marker','*','MarkerSize',10,'MarkerEdgeColor','b', 'MarkerFaceColor','k'];
% % plot(ax1,cloud_delay1)
% % plot(ax1,AWS1)
% % title(ax1,'Overal end-to-end delay')
% ylabel(ax1,'Overal Delay of Network')
% xlabel(ax1,'Number of Instances')
% 
% ax2 = subplot(1,2,2 ); % bottom subplot
% pp=plot(ax2,[1 2 3 4],Cor_used);
% pp(1).Color='b';
% pp(1).LineStyle='--';
% pp(1).LineWidth=2;
% pp(1).Marker='s';
% pp(1).MarkerSize=10;
% pp(1).MarkerEdgeColor='b';
% pp(1).MarkerFaceColor='k';
% 
% % pp(2).Color='r';
% % pp(2).LineStyle=':';
% % pp(2).LineWidth=2;
% % pp(2).Marker='*';
% % pp(2).MarkerSize=10;
% % pp(2).MarkerEdgeColor='r';
% % pp(2).MarkerFaceColor='r';
% % title(ax2,'Used Core')
% ylabel(ax2,'Number of Used Cores')
% xlabel(ax2,'Number of Instances')
% legend('sin(t)','cos(t)','tan(t)');

load ovariancancer;

[U,S,V]= svd(obs,'econ')

figure
subplot(1,2,1)
semilogy(diag(S),'k-o','Linewidth',2.5)
set(gca, 'FontSize',15), axis tight, grid on
subplot(1,2,2)
plot(cumsum(diag(S))./sum(diag(S)),'k-o','Linewidth',2.5)
set(gca, 'FontSize', 15), axis tight,grid on

set(gcf, 'Position', [80 200 600 400])
    
figure, hold on
for i=1:size(obs,1)
    x= V(:,1)'*obs(i,:)';
    y= V(:,2)'*obs(i,:)';
    z= V(:,3)'*obs(i,:)';
    if (strcmp(grp(i),'Cancer'))%(grp(i)=='Cancer')%isequal(grp{i},'Cancer')
        plot3(x,y,z,'rx','LineWidth',3);
    else
        plot3(x,y,z,'bo','LineWidth',3);
    end
    
end
xlabel('PC1'), ylabel('PC2'), zlabel('PC3')
view(85,25), grid on, set(gca,'Fontsize',15)
set(gcf,'position',[650 200 650 400])
    

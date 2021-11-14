function up=ud(uk)
n=length(uk);
N=(n-1)/2+1;
up=zeros(N,1);

up(1)=uk(1);
up(N)=uk(n);
for i=2:N-1
    up(i)=(uk(2*i-2)+2*uk(2*i-1)+uk(2*i))/4;
end

end
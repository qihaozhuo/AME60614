function up=ua(uk)
n=length(uk);
N=(n-1)*2+1;
up=zeros(N,1);

for i=1:n
    up(2*i-1)=uk(i);
end
for i=1:n-1
    up(2*i)=(up(2*i-1)+up(2*i+1))/2;
end

end
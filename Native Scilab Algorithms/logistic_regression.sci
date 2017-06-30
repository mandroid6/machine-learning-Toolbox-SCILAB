function logistic_regression(data)
//currently designed to classify inputs with only 2 features and 2 classes
    
b0 = 5;
t = b0 * rand(100,2);
t = [t 0.5+0.5*sign(t(:,2)+t(:,1)-b0)];

b = 1;
flip = find(abs(t(:,2)+t(:,1)-b0)<b);
t(flip,$)=grand(length(t(flip,$)),1,"uin",0,1);


c0 = t(find(t(:,$)==0),:);
c1 = t(find(t(:,$)==1),:);

clf(0);scf(0);
plot(c0(:,1),c0(:,2),'bo')
plot(c1(:,1),c1(:,2),'rx')




x = t(:, 1:$-1); y = t(:, $);

[m, n] = size(x);




// Add intercept term to x
x = [ones(m, 1) x];




// Initialize fitting parameters
theta = zeros(n + 1, 1);

// Learning rate and number of iterations

a = 0.01;
n_iter = 10000;

for iter = 1:n_iter do
    z = x * theta;
    h = ones(z) ./ (1+exp(-z));
    theta = theta - a * x' *(h-y) / m;
    J(iter) = (-y' * log(h) - (1-y)' * log(1-h))/m;
end

disp(theta);

u = linspace(min(x(:,2)),max(x(:,2)));

clf(1);scf(1);
plot(c0(:,1),c0(:,2),'bo')
plot(c1(:,1),c1(:,2),'rx')
plot(u,-(theta(1)+theta(2)*u)/theta(3),'-g')

//cost function plot to check convergence
clf(2);scf(2);
plot(1:n_iter, J');
xtitle('Convergence','Iterations','Cost');



endfunction



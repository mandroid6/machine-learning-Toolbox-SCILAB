
function linear_regression(data)

t1= t(:,1);
t2= t(:,2);
clf(0);scf(0);
plot(t1,t2,'bx');



x = t1; y = t2;



[m, n] = size(x);




// Add intercept term to x
x = [ones(m, 1) x];




// Initialize fitting parameters
theta = zeros(n + 1, 1);

// Learning rate and number of iterations

a = 0.01;
n_iter = 10000;

for iter = 1:n_iter do
    theta = theta - a * (x' *(x*theta-y)) / m;
    J(iter) = 1/(2*m) * sum((x*theta -y).^2)
end

disp(theta)



clf(1);scf(1);
plot(t1,t2,'rx');
plot(x(:,2), x*theta, '-')

//cost function plot to check convergence
clf(2);scf(2);
plot(1:n_iter, J');
xtitle('Convergence','Iterations','Cost');


endfunction




//demo for the above feature
data=csvRead("random_linear.csv");
linear_regression(data);

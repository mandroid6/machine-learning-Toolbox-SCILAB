pyImport matplotlib
mpl = matplotlib;
py = pyBuiltin();
pyImport numpy
np = numpy;

pyImport sklearn.cluster
cluster = sklearn.cluster
pyImport sklearn.metrics
metrics = sklearn.metrics;

n_features = 2000;
t = np.pi * np.linspace(0, 1, n_features);

  

//def sqr(x):
//    return np.sign(np.cos(x))


X = py.list();
y = py.list();

for i, (phi, a) in enumerate([(.5, .15), (.5, .6), (.3, .2)]):
    for _ in range(30):
        phase_noise = .01 * np.py.random.normal()
        amplitude_noise = .04 * np.py.random.normal()
        additional_noise = 1 - 2 * np.py.random.rand(n_features)
        // Make the noise sparse
        additional_noise[np.py.abs(additional_noise) < .997] = 0

        X.py.append(12 * ((a + amplitude_noise)
                 * (np.sign(np.cos(6 * (t + phi + phase_noise))))
                 + additional_noise))
        y.py.append(i)

X = np.array(X)
y = np.array(y)

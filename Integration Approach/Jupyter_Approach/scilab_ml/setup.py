from setuptools import setup

setup(name='ScilabML',
      version='0.1',
      description='Machine learning toolbox for scilab',
      author='Mandar Deshpande',
      author_email='mandar061095@gmail.com',
      packages=['Scilab_ml'],
      install_requires=[
          'numpy','scikit-learn','pandas','jupyter_client','scipy'
      ],
      zip_safe=False)

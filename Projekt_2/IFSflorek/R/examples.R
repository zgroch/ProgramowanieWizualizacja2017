koch <- createIFS(
  function(x) {
    transformation(x, 0.3333, 0, 0, 0.3333, 0, 0)
  },
  function(x) {
    transformation(x, 0.1667, -0.2887, 0.2887, 0.1667, 0.3333, 0.0000)
  },
  function(x) {
    transformation(x, 0.1667, 0.2887, -0.2887, 0.1667, 0.5000, 0.2887)
  },
  function(x) {
    transformation(x, 0.3333, 0, 0, 0.3333, 0.6667, 0)
  }
)


sierpinski_gasket <- createIFS(
  function(x) {
    transformation(x, 0.5, 0, 0, 0.5)
  },
  function(x) {
    transformation(x, 0.5, 0, 0, 0.5, 0.5, 0)
  },
  function(x) {
    transformation(x, 0.5, 0, 0, 0.5, 0.25, sqrt(3) / 4)
  }
)

fractal_tree <- createIFS(
  function(x) {
    transformation(x, 0.05, 0, 0, 0.4, -0.06, -0.47)
  },
  function(x) {
    transformation(x, -0.05, 0, 0, -0.4, -0.06, -0.47)
  },
  function(x) {
    transformation(x, 0.03, -0.14, 0, 0.26, -0.16, -0.01)
  },
  function(x) {
    transformation(x, -0.03, 0.14, 0, -0.26, -0.16, -0.01)
  },
  function(x) {
    transformation(x, 0.56, 0.44, -0.37, 0.51, 0.3, 0.15)
  },
  function(x) {
    transformation(x, 0.19, 0.07, -0.1, 0.15, -0.2, 0.28)
  },
  function(x) {
    transformation(x, -0.33, -0.34, -0.33, 0.34, -0.54, 0.39)
  }
)



heighway_dragon <- createIFS(
  function (x){
    transformation(x, 0.5, -0.5, 0.5, 0.5)
  },
  function(x) {
    transformation(x, -0.5, -0.5, 0.5, -0.5, 1, 0)
  }
)


barnsley_fern <- createIFS(
  function(x) {
    transformation(x, 0, 0, 0, 0.16, 0, 0)
  },
  function(x) {
    transformation(x, 0.85, 0.04, -0.04, 0.85, 0, 1.6)
  },
  function(x) {
    transformation(x, 0.2, -0.26, 0.23, 0.22, 0, 1.6)
  },
  function(x) {
    transformation(x, -0.15, 0.28, 0.26, 0.24, 0, 0.44)
  }
)

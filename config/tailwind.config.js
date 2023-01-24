const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    backgroundImage: {
      gunmetal: 'linear-gradient(0deg,#020024,#142148 35%,#200304)',
      redmetal: 'linear-gradient(0deg,#a20606,#751616 35%,#ff1313)',
      crimsonmetal: 'linear-gradient(to right bottom, rgb(190, 24, 93), rgb(136, 19, 55), rgb(190, 18, 60))',
      lightmetal: 'linear-gradient(0deg, rgba(92,92,98,1) 0%, rgba(110,116,134,1) 35%, rgba(94,94,99,1) 100%)'
    },
    extend: {
      fontFamily: {
        sans: ['Koulen', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
};

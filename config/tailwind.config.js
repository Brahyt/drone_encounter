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
      gunmetal: 'linear-gradient(0deg, rgba(2,0,36,1) 0%, rgba(43,57,98,1) 35%, rgba(17,17,18,1) 100%)',
      redmetal: 'linear-gradient(0deg,#a20606,#751616 35%,#ff1313)'
    },
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
};

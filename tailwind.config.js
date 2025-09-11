/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        primary: '#FF5A5F',
        secondary: '#FFB400',
        accent: '#1A1A1D'
      },
      fontFamily: {
        sans: ['Inter', 'ui-sans-serif', 'system-ui'],
        serif: ['Merriweather', 'serif'],
      },
      spacing: {
        '128': '32rem',
      }
    },
  },
  plugins: [],
}

// Future versions of Hyper may add additional config options;
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

const backgroundColor = '#272935';
const foregroundColor = '#eff0ea';
const selectionColor = '#92bbd0';
const fontSize = 16;
const fontFamily = '"Source Code Pro for Powerline"';

const black = '#000000';
const red = '#ff5b56';
const green = '#5af78d';
const yellow = '#f3f99c';
const blue = '#57c7fe';
const magenta = '#ff69c0';
const cyan = '#9aecfe';
const white = '#f1f1f0';
const lightBlack = '#686767';
const lightRed = '#ff5b56';
const lightGreen = '#5af78d';
const lightYellow = '#f3f99c';
const lightBlue = '#57c7fe';
const lightMagenta = '#ff69c0';
const lightCyan = '#9aecfe';
const lightWhite = '#f1f1f0';

const colors = {
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
  lightBlack,
  lightRed,
  lightGreen,
  lightYellow,
  lightBlue,
  lightMagenta,
  lightCyan,
  lightWhite,
};

module.exports = {
  config: {
    updateChannel: 'stable',
    fontSize,
    fontFamily,
    fontWeight: 'bold',
    fontWeightBold: 'bold',
    lineHeight: 1,
    letterSpacing: 0,
    cursorColor: 'rgba(255,255,255,0.5)',
    cursorAccentColor: '#000',
    cursorShape: 'UNDERLINE',
    cursorBlink: false,
    foregroundColor,
    backgroundColor,
    selectionColor,
    borderColor: '#333',
    css: `
      .footer_footer {
        font-size: ${fontSize}px !important;
        font-family: ${fontFamily} !important;
      }
    `,
    termCSS: '',
    showHamburgerMenu: '',
    showWindowControls: '',
    padding: '12px 14px',
    colors,
    shell: '',
    shellArgs: ['--login'],
    env: {},
    bell: 'SOUND',
    copyOnSelect: false,
    defaultSSHApp: true,
    quickEdit: false,
    macOptionSelectionMode: 'vertical',
    webGLRenderer: true,
    // Plugin config
    hyperStatusLine: {
      dirtyColor: red,
      aheadColor: green,
      footerTransparent: false
    }
  },

  plugins: ['hyper-statusline'],

  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  },
};

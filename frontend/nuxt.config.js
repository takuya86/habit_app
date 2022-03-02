import colors from 'vuetify/es5/util/colors'

const environment = process.env.NODE_ENV || 'development';
const envSet = require(`./env.${environment}.js`)

export default {

  env: envSet,

  server: {
    port: 3000,
    host: '0.0.0.0',
  },

  publicRuntimeConfig: {
    appName: process.env.APP_NAME,
  },

  head: {
    titleTemplate: '%s - frontend',
    title: 'frontend',
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' }
    ],
    link: [
    ]
  },

  css: [
  ],

  plugins: [
    '~/plugins/axios.js',
    '@/plugins/vee-validate.js',

  ],

  components: true,

  buildModules: [],

  modules: [
    '@nuxtjs/vuetify',
    '@nuxtjs/proxy',
    '@nuxtjs/axios',
    '@nuxtjs/auth',
  ],

  proxy: {
    '/api/v1': {
      target: 'http://backend:5000',
      pathRewrite: {
        '^/api': '/api/v1/',
      },
    },
  },

  vuetify: {
    customVariables: ['~/assets/variables.scss'],
    theme: {
      dark: false,
      themes: {
        dark: {
          primary: colors.blue.darken2,
          accent: colors.grey.darken3,
          secondary: colors.amber.darken3,
          info: colors.teal.lighten1,
          warning: colors.amber.base,
          error: colors.deepOrange.accent4,
          success: colors.green.accent3
        }
      }
    }
  },

  build: {
    transpile: [
      "vee-validate/dist/rules"
    ],
  },

  axios: {
    baseURL: "http://localhost:5000"
  },

  auth: {
    redirect: {
      login: '/login', //middleware:authを設定したURLにアクセスがあった場合の、リダイレクト先。
      logout: '/', //ログアウト後のリダイレクト先
      callback: false,
      home: '/' ///ログイン後のリダイレクト先。
    },
    strategies: {
      local: {
        endpoints: {
          //ログイン処理に関する設定
          login: { url: '/api/v1/auth/sign_in', method: 'post', propertyName: 'access_token'},
          //ログアウト処理に関する設定
          logout: { url: '/api/v1/auth/sign_out', method: 'delete' },
          //ログイン時にユーザー情報を保存するか。
          user: false
        },
      }
    },
  },
}

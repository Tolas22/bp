import { defineStore } from 'pinia'
import axios from "axios";
export const useUserStore = defineStore('user', {
  state: () => ({
    loggedIn: false,
    token: null,
    error: null
  }),
  getters: {
    isLoggedIn: state => {
      return state.loggedIn || !!state.token
    }
  },
  actions: {
    async login(credentials, callback) {
      try {
        console.log(credentials)
        const response = await axios.post('/api/login', JSON.stringify(credentials),
            {headers: {
              "Content-Type": 'application/json'
              }})
        // set token for server requests
        this.token = response.data.access_token
        this.loggedIn = true
        localStorage.setItem('token', this.token)
        callback();
      } catch (error) {
        this.error = error.response
        console.error('Login failed:', error.response.data)
        return false
      }
  },
    initializeAuth() {
      const token = localStorage.getItem('token')
      if (token) {
        this.token = token
        this.loggedIn = true
      }
    }
  }
})

<template>
  <section>
    <el-row>
      <a href="/" class="title">Conference Deadlines</a>
      <github-button style="padding-left: 5px"></github-button>
      <span v-if="showLatestConf" style="color:#fd3c95;font-weight: bold;">Latest: {{this.showStr}} !!!</span>
    </el-row>
    <el-row class="subtitle">
      Conference on Artifical Intelligent and Information Security. To add/edit a conference, <a style="color: #666666" href="https://github.com/itssec/confddl/pulls">send a pull request.</a>
    </el-row>
    <el-row class="subtitle">
    </el-row>
  </section>
</template>

<script>
import GithubButton from './GithubButton'
export default {
  name: 'Header',
  components: {GithubButton},
  data() {
    return {
      showLatestConf: false,
      showStr: ''
    }
  },
  mounted() {
    this.$http.get('https://api.github.com/repos/itssec/confddl/commits?page=1&per_page=10').then(response => {
      let len = response.body.length

      for(let i = 0; i < len; i++) {
        let str = response.body[i].commit.message
        let strArr = str.split(' ')
        let idx=str.indexOf('(');
        if(strArr[0].toLowerCase() === 'update' || strArr[0].toLowerCase() === 'add'){
          if(idx !== -1){
            str = str.substr(0, idx)
          }
          this.showStr = str
          this.showLatestConf = true
          break;
        }
      }
    })
  },
}
</script>

<style scoped>
.title{
  font-size: 29px;
  color: #2c3e50;
}
.subtitle{
  padding-top: 15px;
  color: #666666;
}
</style>

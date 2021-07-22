<template>
<wrapper>
    <div class="vh-100">
  <v-card
  >
    <v-list dense>
      <v-subheader>All Categories</v-subheader>
      <v-list-item-group
        color="primary"
        v-if="categories != null"
      >
        <v-list-item
          v-for="(category, index) in categories" :key="index"
          :href="'/location/' + located +'/category/' + category.slug"
        >
          <v-list-item-icon>
            <v-icon color="success">mdi-briefcase</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>
                {{category.name}}
            </v-list-item-title>
          </v-list-item-content>
          <v-list-item-icon>
            <v-icon>mdi-chevron-right</v-icon>
          </v-list-item-icon>
          
        </v-list-item>


      </v-list-item-group>
    </v-list>
  </v-card>





    </div>
    </wrapper>
</template>
<script>
  import Wrapper from '..//layouts/default';
export default {
  components: {Wrapper},
  data() {
    return {
        categories: '',
        located: 'nigeria',

    }
  },

  created(){
      this.allCategories();
    },
  methods: {
        allCategories() {
            axios.get('api/categories')
                .then((response)=>{
                    this.categories = response.data.categories;
                }).catch(err => {
                    // alert('Please Reload');
                    // location.reload();

                });            
        }

  },
  mounted() {
  },
}
</script>

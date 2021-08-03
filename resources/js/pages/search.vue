<template>
    <div>
    <div>
            <v-btn @click.stop="locationBox = true" x-small rounded color="grey lighten-2" class="text-black-50">
                <v-icon color="black">mdi-navigation</v-icon>
                Change location
              </v-btn>

         </div>
    <v-dialog
      v-model="locationBox"
      max-width="500px"
    >
      <v-card>
        <v-toolbar color="white">
          <v-toolbar-title >
            Change Location
            <v-icon>mdi-navigation</v-icon>
          </v-toolbar-title>
          <v-spacer></v-spacer>
          <v-btn
          dark
          icon
          @click="locationBox = false"
          >
            <v-icon>mdi-close</v-icon>
          </v-btn>
        </v-toolbar>

        <v-card-text>
          <v-list>
            <v-list-item
            v-for="(locationd, indeee) in locations" :key="indeee"
            :href="'/search/'+ locationd.slug + '/' + filteration(term)"
            >
              <v-list-item-content>
                <v-list-item-title v-text="locationd.location"></v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
        </v-card-text>

      </v-card>
    </v-dialog>


      <h4 class="col-12 text-capitalize font-weight-bold">Best {{location}} online businesses related to {{term}}</h4>
      <v-divider></v-divider>
      <div
        v-for="(post, index) in searched" :key="index"
      >
          <v-card
          class="text-decoration-none"
          flat
          :href="'/business/'+post.slug"
        >
            <v-list-item class="grow" >
              <v-list-item-avatar color="grey darken-3">
                <v-img
                  class="elevation-6"
                  alt=""
                  :src="'/storage/'+post.image"
                ></v-img>
              </v-list-item-avatar>

              <v-list-item-content>
                <v-list-item-title style="white-space: normal !important;">
                  {{post.title}}
                </v-list-item-title>
            <span class="text-muted small">
              <template v-for="(category, index) in post.category">
                <template v-if="index > 0">
                  ,
                </template>
                <span :key="index">{{category.name}}</span>
              </template>

              
            </span>
              </v-list-item-content>
              <v-row
                align="center"
                justify="end"
              >
              <v-icon>mdi-navigation</v-icon>
              {{post.location.location}}
              </v-row>
            </v-list-item>
          <v-card-text class="col-12">
            <v-row
              align="center"
              class="mx-0"
            >
              <v-rating
                :value="post.rate"
                dark
                color="amber"
                dense
                half-increments
                readonly
                size="14"
              ></v-rating>

              <div class="grey--text ml-4">
                4.5 (1)
              </div>
            </v-row>
          </v-card-text>
          <v-card-subtitle>
            {{post.excerpt}}
          </v-card-subtitle>
          <v-card-actions>
          <v-row
          justify="end"
          >
            <v-btn 
          color="success lighten-2"
          large
          v-if="post.company_number"
          :href="'tel:'+post.company_number"
            icon>
              <v-icon color="dark">mdi-phone-outgoing-outline</v-icon>
            </v-btn>
            <v-btn 
          color="success lighten-3"
          large
          v-if="post.company_email"
          :href="'mailto:'+post.company_email"
          target="blank"
            icon>
              <v-icon color="dark">mdi-email-outline</v-icon>
            </v-btn>
            <v-btn 
          color="deep-purple lighten-2"
          large
          v-if="post.instagram"
          target="blank"
          :href="'https://www.instagram.com/'+post.instagram"    
            icon>
              <v-icon color="pink darken-1">mdi-instagram</v-icon>
            </v-btn>
            <v-btn 
          color="deep-purple lighten-2"
            icon
            large
            target="blank"
          v-if="post.twitter"
          :href="'https://www.twitter.com/'+post.twitter"    
            
            >
              <v-icon color="light-blue lighten-3">mdi-twitter</v-icon>
            </v-btn>
            <v-btn v-if="post.facebook" icon large target="blank" :href="'https://www.facebook.com/'+post.facebook">
              <v-icon color="indigo">mdi-facebook</v-icon>

            </v-btn>
            <v-btn 
          color="success"
          large
          v-if="post.whatsapp"
          :href="post.whatsapp"
          target="blank"
            icon>
              <v-icon color="dark">mdi-whatsapp</v-icon>
              
            </v-btn>

          </v-row>


          </v-card-actions>
        </v-card>
        <v-divider></v-divider>
      </div>
          <infinite-loading @infinite="infiniteHandler"></infinite-loading>
  
    </div>
</template>
<script>
export default {
  props: ['term', 'location'],
    data() {
        return {
            searched: [],
            errorMessage: '',
            limitList: 5,
            limit: true,
            page: 1,
            locationBox: false,
            locations: [],
        }
    },
    methods: {
        infiniteHandler($state) {
          let vm  = this;
            // axios.post('/api/finder/?page='+this.page, {search: this.term, location: this.location} )
            //     .then((response)=>{
            //       vm.locations = response.data.locations;
            //       let thsin = response.data.posts.data;
            //       if (thsin.length) {
            //         this.page += 1;
            //         vm.searched.push(...thsin);
            //         $state.loaded();
            //       } else {
            //         $state.complete();
            //       }

            //     }).catch(err => {
            //         // alert('Please Reload');
            //         // location.reload();

            //     });
            axios.get('/api/finder/', 
                  {
                    params: {
                      search: this.filteration(this.term), 
                      location: this.location,
                      page: this.page
                    }
              } )
                .then((response)=>{
                  vm.locations = response.data.locations;
                  let thsin = response.data.posts.data;
                  if (thsin.length) {
                    this.page += 1;
                    vm.searched.push(...thsin);
                    $state.loaded();
                  } else {
                    $state.complete();
                  }

                }).catch(err => {
                    // alert('Please Reload');
                    // location.reload();

                });
                      
        },
        filteration(term) {
          return term.toLowerCase()
                      .trim()
                      .split(' ')
                      .join('-');
        }
    },
}
</script>
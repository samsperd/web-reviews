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
                  <v-list-item-group>
                      <v-list-item class="py-0" style="min-height: unset !important;" v-if="post.location">
                        <v-list-item-icon class="justify-content-end m-0" style="width: 44px !important; margin-right: 11px !important;">
                          <v-icon small class="mt-1" color="grey darken-1">mdi-stop</v-icon>
                        </v-list-item-icon>

                        <v-list-item-content class="py-0">
                          <v-list-item-title class="small">
                            <small class="grey--text text--darken-1">{{post.location.location}}</small>
                            
                          </v-list-item-title>
                        </v-list-item-content>
                      </v-list-item>
        
                      <v-list-item class="grow" >
                        <v-list-item-avatar color="grey darken-3">
                          <v-img
                            class="elevation-6"
                            alt=""
                            :src="'/storage/'+post.image"
                          ></v-img>
                        </v-list-item-avatar>

                        <v-list-item-content>
                          <v-list-item-title class="" style="white-space: normal !important; font-weight: 600 !important; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important">
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
                      <v-row
                      class="col"
                      >
                      <template>
                      <h6 class="text-muted" style=" font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important">4.5 </h6>
                                                <v-rating
                          :value="post.rate"
                          dark
                          color="amber"
                          dense
                          half-increments
                          readonly
                          size="14"
                        ></v-rating>
                      <small class="h6 text-muted" style="white-space: normal !important; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important">(1)</small>
                      </template>
                      <v-spacer></v-spacer>
                        <template>
                      <!-- <v-btn v-if="post.company_number" class="flexcol" icon small>
                        <v-icon class="card" color="success">mdi-phone</v-icon>
                        <span>
                        Call
                        </span>
                      </v-btn> -->
                      <template>
                      <v-spacer></v-spacer>
                      <v-btn class="flexcol" icon small>
                        <v-icon color="success">mdi-whatsapp</v-icon>
                        <span>
                        Whatsapp
                        </span>
                      </v-btn>
                      </template>
                        </template>
                      </v-row>
                          
                        </v-list-item-content>
                      </v-list-item>
      </v-list-item-group>
                    <v-card-actions>
                      <v-row class="px-3 py-0" justify="start">
                        <v-btn
                        plain
                        class="text-lowercase"
                          v-if="post.instagram"
                        >
                          <v-icon color="pink darken-3" left>
                            mdi-instagram
                          </v-icon>
                          {{post.instagram}}
                        </v-btn>
                        <v-btn
                        plain
                        class="text-lowercase"
                        v-else-if="post.facebook"
                        >
                          <v-icon
                          
                          small
                          color="indigo" left>
                            mdi-facebook
                          </v-icon>
                          {{post.facebook}}
                        </v-btn>
                        <v-btn
                        plain
                        class="text-lowercase"
                        v-if="post.twitter"
                        >
                          <v-icon small color="cyan" left>
                            mdi-twitter
                          </v-icon>
                          {{post.twitter}}
                        </v-btn>
                        <v-btn
                        plain
                        class="text-lowercase"
                        v-else-if="post.facebook"
                        >
                          <v-icon
                          
                          small
                          color="indigo" left>
                            mdi-facebook
                          </v-icon>
                          {{post.facebook}}
                        </v-btn>
                        
                      </v-row>
                   </v-card-actions>
                    <v-card-subtitle class="text-capitalize" style="color: rgba(0,0,0,0.8) !important;">
                      {{post.deals_with}}
                    </v-card-subtitle>
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
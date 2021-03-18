import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import { UsersService } from "src/app/users/users.service";

//import {
//  AccountService
//} from '../../../core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html'
})
export class HeaderComponent implements OnInit {
  isHidden = false;
  collapse: boolean = true;
  searchValue: string;
  goingSearch = false;
  currentUser;

  constructor(public userService: UsersService) {


  }
  ngOnInit() {
    var result = this.userService.getToken();
    if (result != '') {
      this.isHidden = false;
      this.currentUser = result;

    }
    else if (result == '') {
      this.isHidden = true;
      this.currentUser = null;
    }
   
  }

  signOut() {
    this.currentUser = null;
    var result = this.userService.logOut();
  
  }


}

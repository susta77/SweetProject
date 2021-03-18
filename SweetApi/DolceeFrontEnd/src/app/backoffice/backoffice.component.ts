import { Component, OnInit } from '@angular/core';
import { ServiceService } from '.././service.service';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { UsersService } from '../users/users.service';

@Component({
  selector: 'app-backoffice',
  templateUrl: './backoffice.component.html',
  styleUrls: ['./backoffice.component.css']
})
export class BackofficeComponent implements OnInit {

  submitted = false;
  EmpForm: FormGroup;
  EventValue: any = "Save";
  data: any;
  dolce: any;
  dolceSelected;
  currentUser;
  isOpen = false;
  message;

  constructor(private ServiceService: ServiceService, public userService: UsersService) { }

  aggiungiVetrina() {

    if (this.dolceSelected == undefined) {
   
      return;
    }

    this.ServiceService.inserisciDolceVetrina(this.dolceSelected).subscribe((data: any[]) => {
      this.dolce = data;
    })
   
    window.location.reload();
  }
  // Choose city using select dropdown
  changeDolce(e) {
    this.dolceSelected = e.target.value;

  }
  resetFrom() {
    this.getdata();
    this.EmpForm.reset();
    this.EventValue = "Save";
    this.submitted = false;
  }


  ngOnInit(): void {
    this.getdata();

    this.EmpForm = new FormGroup({
     /* pk_Dolce: new FormControl(null),*/
      Nome: new FormControl("", [Validators.required]),
      Descrizione: new FormControl("", [Validators.required]),
      Data: new FormControl("", [Validators.required]),
    })

    var result = this.userService.getToken();
    if (result != '') {
      this.currentUser = result;
    }
    else if (result == '') {
      this.currentUser = null;
    }

  }

  getdata() {
    this.ServiceService.getData().subscribe((data: any[]) => {
      this.data = data;
    })
    this.ServiceService.getDolci().subscribe((data: any[]) => {
      this.dolce = data;
    })
  }

}

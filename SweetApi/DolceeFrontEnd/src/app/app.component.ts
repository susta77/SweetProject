import { ServiceService } from './service.service';
import { FormGroup, FormControl, Validators } from '@angular/forms';

import { Overlay, OverlayRef } from "@angular/cdk/overlay";
import { ComponentPortal } from "@angular/cdk/portal";
import { Component, VERSION } from "@angular/core";
import { IngredientiComponent } from './ingredienti/ingredienti.component';
import { formatDate } from '@angular/common';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  
  title = 'VetrinaFrontEnd';
  isOpen = false;
  constructor(private ServiceService: ServiceService) { }
  data: any;
  ingredienti: any;
  EmpForm: FormGroup;
  submitted = false;
  EventValue: any = "Save";
  isBackOfficeShown: boolean;
  isVetrinaShown: boolean;

  ngOnInit(): void {
    
    this.getdata();
    this.isBackOfficeShown = false;
    this.isVetrinaShown = true;

    this.EmpForm = new FormGroup({
      pk_vetrina: new FormControl(null),
      Nome: new FormControl("", [Validators.required]),
      Descrizione: new FormControl("", [Validators.required]),
      Data: new FormControl("", [Validators.required]),
      
    })
  }

  getdata() {
    this.ServiceService.getData().subscribe((data: any[]) => {
      this.data = data;
    })
  }
  getIngredienti(id) {
    this.ServiceService.getIngredienti(id).subscribe((data: any[]) => {
      this.ingredienti = data;
    })
  }
  deleteData(id) {
    this.ServiceService.deleteData(id).subscribe((data: any[]) => {
      this.data = data;
      this.getdata();
    })
  }
  Save() {
    this.submitted = true;

    if (this.EmpForm.invalid) {
      return;
    }
    this.ServiceService.postData(this.EmpForm.value).subscribe((data: any[]) => {
      this.data = data;
      this.resetFrom();

    })
  }
  Update() {
    this.submitted = true;

    if (this.EmpForm.invalid) {
      return;
    }
    this.ServiceService.putData(this.EmpForm.value.empId, this.EmpForm.value).subscribe((data: any[]) => {
      this.data = data;
      this.resetFrom();
    })
  }

  EditData(Data) {
    this.EmpForm.controls["empId"].setValue(Data.empId);
    this.EmpForm.controls["empName"].setValue(Data.empName);
    this.EmpForm.controls["empContact"].setValue(Data.empContact);
    this.EmpForm.controls["empEmail"].setValue(Data.empEmail);
    this.EmpForm.controls["empAddress"].setValue(Data.empAddress);
    this.EventValue = "Update";
  }

  resetFrom() {
    this.getdata();
    this.EmpForm.reset();
    this.EventValue = "Save";
    this.submitted = false;
  }
}  

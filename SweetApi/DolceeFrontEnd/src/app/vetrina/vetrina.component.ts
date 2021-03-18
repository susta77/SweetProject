import { Component, OnInit } from '@angular/core';
import { ServiceService } from '.././service.service';


@Component({
  selector: 'app-vetrina',
  templateUrl: './vetrina.component.html',
  styleUrls: ['./vetrina.component.css']
})
export class VetrinaComponent implements OnInit {
  isBackOfficeShown = false;
  isVetrinaShown = true;
  isOpen = false;
  ingredienti;
 



  constructor(private ServiceService: ServiceService) { }



  toggleShow() {
    this.isBackOfficeShown = !this.isBackOfficeShown;
    this.isVetrinaShown = !this.isVetrinaShown;
  }
  data: any;
  ngOnInit(): void {
    this.getdata();


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

}

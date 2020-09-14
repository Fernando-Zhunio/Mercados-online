import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-tendero',
  templateUrl: './tendero.page.html',
  styleUrls: ['./tendero.page.scss'],
})
export class TenderoPage implements OnInit {

  constructor(private router:Router, public route:ActivatedRoute) { }

  ngOnInit() {
  }

  goCart(){
    
    this.router.navigate(['tendero/nueva-tienda'])
  }
}

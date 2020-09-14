import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-nueva-tienda',
  templateUrl: './nueva-tienda.page.html',
  styleUrls: ['./nueva-tienda.page.scss'],
})
export class NuevaTiendaPage implements OnInit {

  constructor() { }

  formRegisterLocal:FormGroup = new FormGroup({
    nombre: new FormControl(null, [Validators.required]),
    telefono: new FormControl(null, [Validators.required]),
    categoria: new FormControl(null, [Validators.required]),
    descripcion: new FormControl(null, [Validators.required]),
  })
  ngOnInit() {
  }

}

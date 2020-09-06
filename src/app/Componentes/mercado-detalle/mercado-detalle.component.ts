import { environment } from './../../../environments/environment';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ClientesService } from '../../Servicios/clientes.service';

@Component({
  selector: 'app-mercado-detalle',
  templateUrl: './mercado-detalle.component.html',
  styleUrls: ['./mercado-detalle.component.scss'],
})
export class MercadoDetalleComponent implements OnInit {

  constructor(private router:ActivatedRoute,private svcCliente:ClientesService) { }

  mercado_detalle:any;
  puestos = [];
  end_point:string = environment.end_point+"storage/";
  ngOnInit() {
    let id = this.router.snapshot.params.id;
    console.log({id});
    this.svcCliente.getMercado(id).subscribe((res:any)=>{
      this.mercado_detalle = res.data;
      console.log(res);
    })
    
    
  }

  

}

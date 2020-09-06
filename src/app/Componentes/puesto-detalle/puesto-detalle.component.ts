import { Component, OnInit } from '@angular/core';
import { ClientesService } from '../../Servicios/clientes.service';
import { ActivatedRoute } from '@angular/router';
import { environment } from 'src/environments/environment';
import { ModalController } from '@ionic/angular';
import { AddCartModalComponent } from '../Modals/add-cart-modal/add-cart-modal.component';

@Component({
  selector: 'app-puesto-detalle',
  templateUrl: './puesto-detalle.component.html',
  styleUrls: ['./puesto-detalle.component.scss'],
})
export class PuestoDetalleComponent implements OnInit {

  constructor(private modalController:ModalController,private svcCliente:ClientesService,private router:ActivatedRoute) { }

  puesto:{id:null,codigo:null};
  vendedor:any;
  productos = [];
  mercado:any;
  end_point = environment.end_point+'storage/';
  ngOnInit() {
    const id = this.router.snapshot.params.id;
    this.svcCliente.getPuesto(id).subscribe((res:any)=>{
      console.log(res);
      
      if(res.success)
      {
        this.puesto= {
          id:res.data.id,
          codigo : res.data.codigo
        }
        this.vendedor = res.data.vendedor;
        this.productos = res.data.productos;
        this.mercado = res.data.mercado;
        console.log({productos:this.productos});
        
      }
    })
  }

  async presentModal(id) {
    const modal = await this.modalController.create({
      component: AddCartModalComponent,
      cssClass: 'my-custom-class',
      componentProps: {producto:this.productos[id],mercado:this.mercado,end_point:this.end_point}
    });
    return await modal.present();
  }
  

}

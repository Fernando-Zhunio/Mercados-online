import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ClientePage } from './cliente.page';
import { MercadoDetalleComponent } from '../../Componentes/mercado-detalle/mercado-detalle.component';
import { MercadoComponent } from '../../Componentes/mercado/mercado.component';
import { PuestoDetalleComponent } from '../../Componentes/puesto-detalle/puesto-detalle.component';
import { CarritoComponent } from '../../Componentes/carrito/carrito.component';
import { ProfileComponent } from '../../Componentes/profile/profile.component';

const routes: Routes = [
  // {
  //   path: '',
  //   component: ClientePage,
  //   children:[
  //     {path:'',component:MercadoComponent},
  //     {path:'mercado-detalle/:id',component:MercadoDetalleComponent,
  //     children:[
  //     ]},
  //     {path:'puesto-detalle/:id',component:PuestoDetalleComponent},
  //     {path:'cart',component:CarritoComponent}
  //   ]
  // },
  {path:'',component:ClientePage,children:[
    {path:'',redirectTo:'mercado'},
    {
      path: 'mercado',
      loadChildren: () => import('../../Page/cliente/mercado/mercado.module').then( m => m.MercadoPageModule),
      children:[
        {path:'',component:MercadoComponent},
        {path:'mercado-detalle/:id',component:MercadoDetalleComponent,
        children:[
        ]},
        {path:'puesto-detalle/:id',component:PuestoDetalleComponent},
        {path:'cart',component:CarritoComponent}
      ]
    },
    {
      path: 'pedidos',
      loadChildren: () => import('../../Page/cliente/pedidos/pedidos.module').then( m => m.PedidosPageModule)
    },
    {
      path:'perfil',component:ProfileComponent
    }
  ]},
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ClientePageRoutingModule {}

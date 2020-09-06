import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { TenderoPage } from './tendero.page';

describe('TenderoPage', () => {
  let component: TenderoPage;
  let fixture: ComponentFixture<TenderoPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TenderoPage ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(TenderoPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

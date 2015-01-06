
package aeroportosimulator;

import java.awt.Color;
import java.awt.Component;
import java.awt.TextField;
import java.awt.event.ActionListener;
import java.util.LinkedList;
import java.util.Random;
import javax.swing.JTextField;
import javax.swing.Timer;
import javax.swing.table.TableCellRenderer;


public class Screen extends javax.swing.JFrame {
    
    private int currentT = 0; 
    private int TotalEsperaPouso=0, TotalEsperaDecolagem=0,QtdPusou=0,QtdDecolou=0,TotalFuelPousou=0,TotalFuelDecolou=0,qtdEmergencia=0,qtdDesviado=0;
    LinkedList<String> aeroportos = new LinkedList<String>();
    LinkedList<String> companys = new LinkedList<String>();
  
    public Screen() {
        initComponents();
        
        //preenche companias aereas
        companys.add("TAM");
        companys.add("GOL");
        companys.add("ALI");
        companys.add("VAR");
        companys.add("AZU");
        
        //preenche aeroportos
        aeroportos.add("ABC");
        aeroportos.add("QWE");
        aeroportos.add("RTY");
        aeroportos.add("UIO");
        aeroportos.add("PAS");
        aeroportos.add("DFG");
        aeroportos.add("HJK");
        aeroportos.add("LZX");
        aeroportos.add("CVB");
        aeroportos.add("NMM");
        aeroportos.add("ZAQ");
        aeroportos.add("XSW");
        aeroportos.add("CDE");
        aeroportos.add("VFR");
        aeroportos.add("BGT");
        aeroportos.add("NHY");
        aeroportos.add("MJU");
        aeroportos.add("KIU");
        aeroportos.add("LOI");
        aeroportos.add("POI");
        aeroportos.add("UYT");
        aeroportos.add("GFD");
        aeroportos.add("QDV");
        aeroportos.add("RGN");
        aeroportos.add("YJJ");
        aeroportos.add("AAV");
        aeroportos.add("TUT");
        aeroportos.add("BGH");
        aeroportos.add("LOK");
        
        
        this.initTimer();
        
    }
    
    
    private void mainLoop()
    {
     
      //carrega a seed para random
      int seed = (int)Parameters.SEED.get();        
      int qt_avioes; // onde guarda qtd de aviao de 1...k
      
      if (currentT >= (int)Parameters.T.get())
      return;
       
      
      // controle das pistas
      ManageRoad(this.road1, false);
      ManageRoad(this.road2, false);
      ManageRoad(this.road3, true);
      
      
     // encaminha avioes com pouco combustivel que sobraram para outro aeroporto
     Airplane wPlane=GetWarningFlying();
     
     Random magica;
     if ((int)Parameters.SEED.get() > 0)
        magica = new Random((int)Parameters.SEED.get()+currentT);
     else
        magica = new Random();
     
     while(wPlane != null)
     {
         edtForwards.setText(
           edtForwards.getText()+"\n"+
                 wPlane.getName()+" encaminhado para "+aeroportos.get( magica.nextInt(30) ));
                 
                  
         lstFlying.remove(wPlane);
         qtdDesviado++;
         wPlane=GetWarningFlying();
     }
      
      
      // cosome combustivel
      for(Airplane plane: lstFlying)
      {
          plane.Fuel -=1;
          if (plane.Fuel <= 0){
              plane.Fuel=0;
              plane.warning=true;
          }
      }
      
      for(Airplane plane: lstLanded)
       {
           
          plane.FlyTime -=1;
          if (100-(100*plane.FlyTime)/plane.TotalFlyTime >= 10){
              plane.warning=true;
          }
          if (plane.FlyTime <= 0)
              plane.FlyTime=0;
          
      }
     
      // instcia controle e randomizaçao
      
      if (seed == 0)
          magica = new Random();
      else
          magica = new Random(seed+currentT);
          
       //sorteia quantidade de avioes 
       qt_avioes = magica.nextInt( (int)Parameters.K.get() )+1;
       
       for (int i=0; i< qt_avioes; i++)
       {
        boolean WARN = false;
        
        if (magica.nextInt(15)==10)
        {
            WARN=true;
            qtdEmergencia++;
            
        }  
         Airplane a = new Airplane(
                    companys.get( magica.nextInt(4) ),
                    magica.nextInt(9999),
                    magica.nextInt((int)Parameters.C.get())+1,
                    magica.nextInt((int)Parameters.V.get())+1,
                    aeroportos.get(magica.nextInt(29)),
                    WARN
                 );
         
         //sorteia se pousa ou decola
         if (magica.nextInt(10)<6)
            lstFlying.add(a);
         else
            lstLanded.add(a);
       
       }
       
        currentT++;
        lblTEMPO.setText( Integer.toString(currentT) );        
        
        // contabilza tempo de espera para cada aviao
        for(Airplane plane:lstFlying)
            plane.WaitTime++;
        for(Airplane plane:lstLanded)
            plane.WaitTime++;
        
        
        //prrenche textbox
        if (QtdDecolou>0)
        {
            this.txtMediaDecolagem.setText( Double.toString(TotalEsperaDecolagem / QtdDecolou)  );
            this.txtMediaCombustEspera.setText( Double.toString(TotalFuelDecolou / QtdDecolou)  );
        }
        
        if(QtdPusou>0)
        {
            this.txtMediaPouso.setText(Double.toString(TotalEsperaPouso / QtdPusou));
            this.txtMediaCombustPousado.setText( Double.toString(TotalFuelPousou / QtdPusou)  );
        }
        
        this.txtQtAvioesEmergencia.setText(Integer.toString(qtdEmergencia));
        this.txtQtdAvioesDesviados.setText( Integer.toString(qtdDesviado));
        
       refresh();
    }
    
    
    //controla pistas
    private void ManageRoad(TextField txt, boolean onlyLanding)
    {
      // PISTA 1
      //verifica se tem alguem pra pousar em emergencia.
      Airplane aPlane = GetWarningFlying();
      if (aPlane!=null)
      {
          lstFlying.remove(aPlane);
          toroad(txt, aPlane, 0);  
          return;
      }
      
      // verifica se tem decolagem de emergencia
      aPlane = GetWarningLanding();
      if (aPlane!=null)
      {
          lstLanded.remove(aPlane);
          toroad(txt, aPlane, 1);  
          return;
      }
      
      // se for so pra decolagem
      if (onlyLanding && lstLanded.size()>0)
      {
          toroad(txt, lstLanded.remove(0), 1);  
          return;
      }
      
      //verica se vai decolar ou pousar, leva em consideracao a maior fila
      if (lstFlying.size() >= lstLanded.size())
      { // pousa
          if (lstFlying.size()>0)
          {
             toroad(txt, lstFlying.remove(0), 0);
             return ;
          }
      }
      else
      { // decola
         if(lstLanded.size()>0)
         {
            toroad(txt, lstLanded.remove(0), 1); 
            return;
         }
      }
      
      txt.setText("VAZIO");
      txt.setBackground(Color.WHITE);
      
    }
    
    
    // exibe aviao na pista
    private void toroad(TextField txt,Airplane plane, int action)
    {
        txt.setText(plane.getName());
        if (action ==0)
        {
            QtdPusou++;
            TotalEsperaPouso+=plane.WaitTime;
            TotalFuelPousou+=plane.Fuel;
            txt.setBackground(this.corPouso.getBackground());
        }
        else
        {
            QtdDecolou++;
            TotalEsperaDecolagem+=plane.WaitTime;
            TotalFuelDecolou+=plane.Fuel;
            txt.setBackground(this.corDecolar.getBackground());
        }   
            
    }
    
    
    // busca aviao em warning com priridade em voos especiais
    Airplane GetWarningFlying()
    {
        Airplane a=null;
        
        for(Airplane plane : lstFlying)
            if (plane.warning)
                if (a==null)
                    a = plane;
                else
                  if (plane.Fuel > 0)
                          a= plane;
        return a;
    }
    
        // busca aviao em warning com priridade em voos especiais
    Airplane GetWarningLanding()
    {
        Airplane a=null;
        
        for(Airplane plane : lstLanded)
            if (plane.warning)
                if (a==null)
                    a = plane;
                else // decola o aviao que esta esperando maior tempo em rfelacao a seu tempo de voo
                  if  ( (100-(100*plane.FlyTime)/plane.TotalFlyTime) > (100-(100*a.FlyTime)/a.TotalFlyTime))  
                          a= plane;
        return a;
    }
    
    
    
     private void initTimer() {  
        ActionListener action = new ActionListener() {  
            @Override
            public void actionPerformed(@SuppressWarnings("unused") java.awt.event.ActionEvent e) {  
                mainLoop();  
            }  
        };  
        Timer t = new Timer(1000*(int)Parameters.SECOND_PER_TIME.get(), action);  
        t.start();  
    }  
    
    
    private void refresh()
    {
        org.jdesktop.swingbinding.JTableBinding jTableBinding = org.jdesktop.swingbinding.SwingBindings.createJTableBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, lstFlying, grdFlying);
        org.jdesktop.swingbinding.JTableBinding.ColumnBinding columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${name}"));
        columnBinding.setColumnName("Name");
        columnBinding.setColumnClass(String.class);
        columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${fuel}"));
        columnBinding.setColumnName("Fuel");
        columnBinding.setColumnClass(Integer.class);
        bindingGroup.addBinding(jTableBinding);
        jTableBinding.bind();
        jScrollPane3.setViewportView(grdFlying);

        jTableBinding = org.jdesktop.swingbinding.SwingBindings.createJTableBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, lstLanded, jTable1);
        columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${name}"));
        columnBinding.setColumnName("Name");
        columnBinding.setColumnClass(String.class);
        columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${flyTime}"));
        columnBinding.setColumnName("Fly Time");
        columnBinding.setColumnClass(Integer.class);
        bindingGroup.addBinding(jTableBinding);
        jTableBinding.bind();

    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {
        bindingGroup = new org.jdesktop.beansbinding.BindingGroup();

        lstFlying = new LinkedList<Airplane>();
        lstLanded = new LinkedList<Airplane>();
        jScrollPane3 = new javax.swing.JScrollPane();
        grdFlying = new javax.swing.JTable() {
            public Component prepareRenderer(TableCellRenderer renderer,
                int rowIndex, int vColIndex) {

                Component c = super.prepareRenderer(renderer, rowIndex, vColIndex);
                // altera a cor de background da linha para vermelho e foreground para branco
                // quando o valor da coluna 3 for igual a fechado
                if (lstFlying.get(rowIndex).warning) {
                    c.setBackground(new Color(192, 0, 0));
                    c.setForeground(Color.white);
                } else {
                    // mantem a cor padrão de foreground
                    c.setForeground(getForeground());
                    // determina a cor de background da linha selecionada
                    if(isCellSelected(rowIndex, vColIndex)) {
                        c.setBackground(new Color (184, 207, 229));
                    } else {
                        // linhas não selecionadas, manter cor de background padrão
                        c.setBackground(getBackground());
                    }
                }
                return c;
            }
        };
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable() {
            public Component prepareRenderer(TableCellRenderer renderer,
                int rowIndex, int vColIndex) {

                Component c = super.prepareRenderer(renderer, rowIndex, vColIndex);
                // altera a cor de background da linha para vermelho e foreground para branco
                // quando o valor da coluna 3 for igual a fechado
                if (lstLanded.get(rowIndex).warning) {
                    c.setBackground(new Color(192, 0, 0));
                    c.setForeground(Color.white);
                } else {
                    // mantem a cor padrão de foreground
                    c.setForeground(getForeground());
                    // determina a cor de background da linha selecionada
                    if(isCellSelected(rowIndex, vColIndex)) {
                        c.setBackground(new Color (184, 207, 229));
                    } else {
                        // linhas não selecionadas, manter cor de background padrão
                        c.setBackground(getBackground());
                    }
                }
                return c;
            }
        };
        road2 = new java.awt.TextField();
        road3 = new java.awt.TextField();
        road1 = new java.awt.TextField();
        jLabel1 = new javax.swing.JLabel();
        lblTEMPO = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        edtForwards = new javax.swing.JTextArea();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        corPouso = new javax.swing.JPanel();
        corDecolar = new javax.swing.JPanel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        txtMediaDecolagem = new java.awt.TextField();
        txtMediaPouso = new java.awt.TextField();
        txtMediaCombustEspera = new java.awt.TextField();
        txtMediaCombustPousado = new java.awt.TextField();
        txtQtAvioesEmergencia = new java.awt.TextField();
        txtQtdAvioesDesviados = new java.awt.TextField();

        lstFlying = org.jdesktop.observablecollections.ObservableCollections.observableList(lstFlying);

        lstLanded = org.jdesktop.observablecollections.ObservableCollections.observableList(lstLanded);

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Aeroporto - POO");

        org.jdesktop.swingbinding.JTableBinding jTableBinding = org.jdesktop.swingbinding.SwingBindings.createJTableBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, lstFlying, grdFlying);
        org.jdesktop.swingbinding.JTableBinding.ColumnBinding columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${name}"));
        columnBinding.setColumnName("Name");
        columnBinding.setColumnClass(String.class);
        columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${fuel}"));
        columnBinding.setColumnName("Fuel");
        columnBinding.setColumnClass(Integer.class);
        bindingGroup.addBinding(jTableBinding);
        jTableBinding.bind();
        jScrollPane3.setViewportView(grdFlying);

        jTableBinding = org.jdesktop.swingbinding.SwingBindings.createJTableBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, lstLanded, jTable1);
        columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${name}"));
        columnBinding.setColumnName("Name");
        columnBinding.setColumnClass(String.class);
        columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${flyTime}"));
        columnBinding.setColumnName("Fly Time");
        columnBinding.setColumnClass(Integer.class);
        bindingGroup.addBinding(jTableBinding);
        jTableBinding.bind();

        jScrollPane1.setViewportView(jTable1);

        road2.setBackground(new java.awt.Color(255, 255, 255));
        road2.setEditable(false);
        road2.setText("Pista 2");
        road2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                road2ActionPerformed(evt);
            }
        });

        road3.setBackground(new java.awt.Color(255, 255, 255));
        road3.setEditable(false);
        road3.setText("Pista 3");
        road3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                road3ActionPerformed(evt);
            }
        });

        road1.setBackground(new java.awt.Color(255, 255, 255));
        road1.setEditable(false);
        road1.setText("Pista 1");
        road1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                road1ActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel1.setText("Tempo:");

        lblTEMPO.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        lblTEMPO.setText("0");
        lblTEMPO.setName("lblTEMPO");

        edtForwards.setColumns(20);
        edtForwards.setRows(5);
        jScrollPane2.setViewportView(edtForwards);

        jLabel2.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel2.setText("a pousar");

        jLabel3.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel3.setText("a decolar");

        jLabel4.setText("Pistas");

        corPouso.setBackground(new java.awt.Color(153, 255, 153));

        javax.swing.GroupLayout corPousoLayout = new javax.swing.GroupLayout(corPouso);
        corPouso.setLayout(corPousoLayout);
        corPousoLayout.setHorizontalGroup(
            corPousoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 14, Short.MAX_VALUE)
        );
        corPousoLayout.setVerticalGroup(
            corPousoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 14, Short.MAX_VALUE)
        );

        corDecolar.setBackground(new java.awt.Color(153, 153, 255));

        javax.swing.GroupLayout corDecolarLayout = new javax.swing.GroupLayout(corDecolar);
        corDecolar.setLayout(corDecolarLayout);
        corDecolarLayout.setHorizontalGroup(
            corDecolarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 14, Short.MAX_VALUE)
        );
        corDecolarLayout.setVerticalGroup(
            corDecolarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );

        jLabel5.setText("Pousando");

        jLabel6.setText("Decolando");

        jLabel7.setText("Messages");

        jLabel8.setText("Media tempo decolagem");

        jLabel9.setText("Media tempo pouso");

        jLabel10.setText("Media Combustivel espera");

        jLabel11.setText("Media combustivel pousado");

        jLabel12.setText("Qtd avioes emergencia");

        jLabel13.setText("Qtd avioes desviados");

        txtMediaDecolagem.setEditable(false);
        txtMediaDecolagem.setText("0");

        txtMediaPouso.setEditable(false);
        txtMediaPouso.setText("0");

        txtMediaCombustEspera.setEditable(false);
        txtMediaCombustEspera.setText("0");

        txtMediaCombustPousado.setEditable(false);
        txtMediaCombustPousado.setText("0");

        txtQtAvioesEmergencia.setEditable(false);
        txtQtAvioesEmergencia.setText("0");

        txtQtdAvioesDesviados.setEditable(false);
        txtQtdAvioesDesviados.setText("0");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 167, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addGap(34, 34, 34)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 156, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3))
                .addGap(30, 50, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(37, 37, 37)
                        .addComponent(jLabel1)
                        .addGap(37, 37, 37)
                        .addComponent(lblTEMPO))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel8)
                            .addComponent(jLabel13)
                            .addComponent(jLabel9))
                        .addGap(26, 26, 26)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtMediaDecolagem, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtMediaPouso, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtQtdAvioesDesviados, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addComponent(jLabel7)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(15, 15, 15)
                        .addComponent(corPouso, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel5)
                        .addGap(18, 18, 18)
                        .addComponent(corDecolar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel6))
                    .addComponent(road2, javax.swing.GroupLayout.PREFERRED_SIZE, 171, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(road1, javax.swing.GroupLayout.PREFERRED_SIZE, 171, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4)
                    .addComponent(road3, javax.swing.GroupLayout.PREFERRED_SIZE, 171, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel10)
                            .addComponent(jLabel11)
                            .addComponent(jLabel12))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtQtAvioesEmergencia, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtMediaCombustEspera, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtMediaCombustPousado, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 268, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(lblTEMPO)
                    .addComponent(jLabel2)
                    .addComponent(jLabel3))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(39, 39, 39)
                        .addComponent(jLabel4)
                        .addGap(1, 1, 1)
                        .addComponent(road1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(1, 1, 1)
                        .addComponent(road2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(2, 2, 2)
                        .addComponent(road3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(corPouso, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(corDecolar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                .addComponent(jLabel5))
                            .addComponent(jLabel6))
                        .addGap(18, 18, 18)
                        .addComponent(jLabel7)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 164, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel8)
                            .addComponent(txtMediaDecolagem, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel9)
                            .addComponent(txtMediaPouso, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtMediaCombustEspera, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel10))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel11)
                            .addComponent(txtMediaCombustPousado, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(16, 16, 16)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtQtAvioesEmergencia, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel12))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel13)
                            .addComponent(txtQtdAvioesDesviados, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(jScrollPane3, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 507, Short.MAX_VALUE)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.LEADING))))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jLabel2.getAccessibleContext().setAccessibleName("Waiting");

        bindingGroup.bind();

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void road2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_road2ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_road2ActionPerformed

    private void road3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_road3ActionPerformed
        // TODO add yo handling code here:
    }//GEN-LAST:event_road3ActionPerformed

    private void road1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_road1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_road1ActionPerformed

   
    public static void main(String args[]) {
        
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /*
         * If Nimbus (introduced in Java SE 6) is not available, stay with the
         * default look and feel. For details see
         * http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Screen.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Screen.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Screen.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Screen.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
               

        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Screen().setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel corDecolar;
    private javax.swing.JPanel corPouso;
    private javax.swing.JTextArea edtForwards;
    private javax.swing.JTable grdFlying;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTable jTable1;
    private javax.swing.JLabel lblTEMPO;
    private java.util.List<Airplane> lstFlying;
    private java.util.List<Airplane> lstLanded;
    private java.awt.TextField road1;
    private java.awt.TextField road2;
    private java.awt.TextField road3;
    private java.awt.TextField txtMediaCombustEspera;
    private java.awt.TextField txtMediaCombustPousado;
    private java.awt.TextField txtMediaDecolagem;
    private java.awt.TextField txtMediaPouso;
    private java.awt.TextField txtQtAvioesEmergencia;
    private java.awt.TextField txtQtdAvioesDesviados;
    private org.jdesktop.beansbinding.BindingGroup bindingGroup;
    // End of variables declaration//GEN-END:variables
}



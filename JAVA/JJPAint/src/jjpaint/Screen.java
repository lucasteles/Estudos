
package jjpaint;

import java.beans.PropertyVetoException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.*;
import java.awt.*;
import javax.swing.border.LineBorder;
import Classes.*;
import Classes.Paint;
import java.awt.event.*;
import java.awt.image.BufferedImage;
import javax.swing.event.AncestorEvent;
import javax.swing.event.AncestorListener;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import java.io.*;
import javax.swing.filechooser.FileNameExtensionFilter;

public class Screen extends JFrame {
    
    //Controles de telas
    private JDesktopPane _Screen;
    int nQtWindows=0;
    
    //Controles de desenho
    private int nTool    = 1;
    private int nSave    = 1;
    
    public Paint oAtualP = new Paint();
    private int nTamanho = 1;
    private Color oColor1 = Color.BLACK;
    private Color oColor2 = Color.white;
    private PaintSurface oPs = null;

    //Toolbars
    MyToolbarTools ToolbarTools = new MyToolbarTools();
    MyToolbarColors ToolbarColors = new MyToolbarColors();
    MyToolbarPropert ToolbarPropert = new MyToolbarPropert();
    
    public Screen()
     {
        super("JJPaint 1.0"); 
        
        _Screen = new JDesktopPane(); // Cria desktop
        add( _Screen ); // Adiciona desktoo ao frame
        
        _Screen.setBackground(Color.GRAY);
        
        //seta ação a fechar frame
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        
        //defini tamanho ao minimizar tela
        setBounds(0, 0,(int) Toolkit.getDefaultToolkit().getScreenSize().getWidth()/2,
                    (int) Toolkit.getDefaultToolkit().getScreenSize().getHeight()/2);
        
        //maximiza tela 
        setExtendedState(JFrame.MAXIMIZED_BOTH);        
        
        //Configura menus de contexto
        this.ConfigMenus();
        
        //Configura Toolbars
        getContentPane().add(ToolbarTools,BorderLayout.WEST);
        getContentPane().add(ToolbarColors,BorderLayout.EAST);
        getContentPane().add(ToolbarPropert,BorderLayout.NORTH);

        ToolbarPropert.SetTool("subLapis");
        this.ToolbarColors.SetColor(1, oColor1);
        this.ToolbarColors.SetColor(2, oColor2);
        
        //abre uma tela
        AddWindow();
     }   
     
    

     //define ações dos menus
     private ActionListener ActionMenus(final String cMenu){
          // retorna ação a ser realizada pelo menu
        
          return new ActionListener(){@Override
              public void actionPerformed( ActionEvent event )
              { 
                  ToolbarPropert.SetTool(cMenu); 
                   
                  if( cMenu.equals("subNewWindow") )    { AddWindow(); }
                  if( cMenu.equals("subLapis") )        { ActionButton(1); }
                  if( cMenu.equals("subFormas") )       {  }
                  if( cMenu.equals("subLine") )         { ActionButton(2); }
                  if( cMenu.equals("subSquare") )       { ActionButton(3); }
                  if( cMenu.equals("subCircle") )       { ActionButton(4); }
                  if( cMenu.equals("subBalde") )        { ActionButton(5); }
                  if( cMenu.equals("subBorracha") )     { ActionButton(6); }
                  if( cMenu.equals("subPincel") )       { ActionButton(7); }
                  if( cMenu.equals("subAbrir") )        { SaveAndOpenFile(0); }
                  if( cMenu.equals("subSalvar") )       { SaveAndOpenFile(1); }
                  if( cMenu.equals("subSalvarComo") )   { SaveAndOpenFile(2); }
              } 
           };
     }       
     
     /*
      * Bloco de ações de menus e toolbars
      */
     private void AddWindow(){
         AddWindow(false);
     }

     private void AddWindow(boolean lMax) {
         
        nQtWindows++;
         
        JInternalFrame oFrame = new JInternalFrame(
        "Paint "+String.valueOf(nQtWindows) , true, true, true, true );
        
        oFrame.setBackground(Color.white);
        oFrame.pack();
        
        oFrame.setBounds(nQtWindows*50,nQtWindows*50,(int) Toolkit.getDefaultToolkit().getScreenSize().getWidth()/ 2,
                    (int) Toolkit.getDefaultToolkit().getScreenSize().getHeight()/2);

        _Screen.add("FTrame" + String.valueOf(nQtWindows), oFrame );

        if (lMax){
            try {
                oFrame.setMaximum(true);
            } catch (PropertyVetoException ex) {
                Logger.getLogger(Screen.class.getName()).log(Level.SEVERE, null, ex);
            }
         }
        // cria a Superface de desenho
        PaintSurface oSurface = new PaintSurface().Size(oFrame.getWidth(), oFrame.getHeight()).Init();
        oFrame.add(oSurface);

        oFrame.setVisible(true);
     }
    
     public void SaveAndOpenFile(int tnTipo)
     {          
        // 0 - Abrir,1 - Salva, 2 - Salva como
        JFileChooser oFileChooser = new JFileChooser();
         
        FileNameExtensionFilter oFilter = new FileNameExtensionFilter(
        ".jjp files", "jjp");
        
        oFileChooser.setFileFilter(oFilter);
        
        File oArquivo = null;
         
        if (tnTipo==0) {
             if(oFileChooser.showOpenDialog(this) != JFileChooser.APPROVE_OPTION)
                return;

                 AddWindow(true);
                 oAtualP.StringToTela( oFileChooser.getSelectedFile().getPath() );
                 oAtualP.cCaminhoAtual = oFileChooser.getSelectedFile().getPath();
                 
                
             return;
        }
        String cTela = oAtualP.TelaToString();
        
        if ("".equals(oAtualP.cCaminhoAtual) || tnTipo == 2) {

            if(oFileChooser.showSaveDialog(this) != JFileChooser.APPROVE_OPTION)
                return;
            
            oArquivo      = oFileChooser.getSelectedFile();
            oAtualP.cCaminhoAtual = oArquivo.getPath();
         }
         else{oArquivo = new File(oAtualP.cCaminhoAtual);}

         FileWriter oWriter = null;
         try {
             String cArquivo =oArquivo.getPath();
             if ( !cArquivo.toUpperCase().contains(".JJP") )
             {
                cArquivo+= ".jjp";
             }

             oWriter = new FileWriter(cArquivo );
             oWriter.write(cTela);
         } 
         catch(IOException ex){
             // Possiveis erros aqui
         } 
         finally {
            if(oWriter != null){
               try{
                   oWriter.close();
               } 
               catch (IOException x){
                   //   
                }
            }
         }
     }
     
     private void ConfigMenus()
     {
         
         JMenuBar TopMenu = new JMenuBar(); 
         JMenu Menu;
         JMenuItem subItem;
         
         //Inicio menu arquivo
             Menu = new JMenu( "Arquivo" );
             
             //definindo subitens
             subItem = new JMenuItem( "Nova Tela" ); //define menu
             subItem.addActionListener( ActionMenus("subNewWindow") );
             Menu.add( subItem );
             
             subItem = new JMenuItem( "Abrir" ); //define menu
             subItem.addActionListener( ActionMenus("subAbrir") );
             Menu.add( subItem );
             
             subItem = new JMenuItem( "Salvar" ); //define menu
             subItem.addActionListener( ActionMenus("subSalvar") );
             Menu.add( subItem );
             
             subItem = new JMenuItem( "Salvar Como" ); //define menu
             subItem.addActionListener( ActionMenus("subSalvarComo") );
             Menu.add( subItem );
             
             subItem = new JMenuItem( "Sair" ); //define menu
             subItem.addActionListener( ActionMenus("subSair") );
             Menu.add( subItem );
             
             TopMenu.add( Menu ); 
             
         //Fim Menu Arquivo
             
         //Inicio menu Ferramentas
             Menu = new JMenu( "Ferramentas" );
             
             //definindo subitens
             subItem = new JMenuItem( "Lapis" ); //define menu
             subItem.addActionListener( ActionMenus("subLapis") );
             Menu.add( subItem );
             
             subItem = new JMenuItem( "Borracha" ); //define menu
             subItem.addActionListener( ActionMenus("subBorracha") );
             Menu.add( subItem );
             
             subItem = new JMenuItem( "Pincel" ); //define menu
             subItem.addActionListener( ActionMenus("subPincel") );
             Menu.add( subItem );
             
             subItem = new JMenuItem( "Balde" ); //define menu
             subItem.addActionListener( ActionMenus("subBalde") );
             Menu.add( subItem );
    
             subItem = new JMenuItem( "Formas" ); //define menu
             subItem.addActionListener( ActionMenus("subFormas") );
             Menu.add( subItem );
             /*
             subItem = new JMenuItem( "Recortar" ); //define menu
             subItem.addActionListener( ActionMenus("subRecort") );
             Menu.add( subItem );
             */
                   
             
             TopMenu.add( Menu ); 
             
             
         //Fim Menu Ferramentas
             
         setJMenuBar( TopMenu ); 
     }
     
     
     
     private void ActionButton(int tnTool)
     {
         nTool = tnTool;
     }

       /*
      * Classes de auxilio
      *
      */
     private class PaintSurface extends JComponent {
        //privates
        private Paint oPaintSu  = null;
        private int nHeight     = 0;
        private int nWidth      = 0;
        //publics
        public Mouse oCtrlMouse     = new Mouse();
        public BufferedImage oImage = null;
        
        public PaintSurface() {
            this.addMouseListener(new MouseAdapter() {
            
            @Override
            public void mousePressed(MouseEvent e) {
                oCtrlMouse.MouseDown(e);
                repaint();
            }

            @Override
            public void mouseReleased(MouseEvent e) {
                oCtrlMouse.MouseUp(e);
                oPaintSu.AddGraf();
                repaint();
            }

            
            @Override
            public void mouseEntered(MouseEvent e) {
                Toolkit toolkit = Toolkit.getDefaultToolkit();  
                String cIcon = "";
                Cursor oCursor = null;
                Point oPonto = new Point(0,0);
                switch (nTool)
                {
                    case 1: 
                        cIcon = "images\\lapis.gif";
                        break;
                    case 2: 
                        cIcon = "";
                        break;
                    case 3: 
                        cIcon = "";
                        break;
                    case 4: 
                        cIcon = "";
                        break;
                    case 5:
                        cIcon = "images\\Balde.gif";
                        oPonto = new Point(0,22);
                        break;
                    default: 
                        cIcon ="";
                        break;
                }
                if (!cIcon.isEmpty()){
                    Image image = toolkit.getImage(cIcon);
                    oCursor = toolkit.createCustomCursor(image, oPonto, "Ico");
                }
                else
                {
                    oCursor = Cursor.getPredefinedCursor(Cursor.CROSSHAIR_CURSOR);
                }
                setCursor(oCursor); 
            }

            @Override
            public void mouseExited(MouseEvent e) {
                 Cursor cNovo = Cursor.getDefaultCursor();
                 setCursor(cNovo); 
            }
          });

          this.addMouseMotionListener(new MouseMotionAdapter() {
            public void mouseDragged(MouseEvent e) {
              oCtrlMouse.MouseMove(e);
              repaint();
            }
            public void mouseMoved(MouseEvent e) {
              oCtrlMouse.MouseMove(e);
            }
          });
          this.addComponentListener(new ComponentAdapter() {
            public void componentResized(ComponentEvent e){
                if (_Screen.getSelectedFrame() != null) {
                    nWidth  = _Screen.getSelectedFrame().getWidth();
                    nHeight = _Screen.getSelectedFrame().getHeight();
                }
            }
        });
        }
        public PaintSurface Size(int tnWidth,int tnHeight){
            nHeight  = tnHeight;
            nWidth   = tnWidth;
            return(this);
        }
        public PaintSurface Init(){
            //oDim   = new Dimension(this.getSize());
            //oImage = new BufferedImage(oDim.width,oDim.height,BufferedImage.TYPE_INT_RGB);
            //Graphics2D oGraphics = (Graphics2D)oImage.getGraphics();
            
            this.setBackground(Color.white);
            oPaintSu = new Paint().Init(this.getGraphics(),nWidth,nHeight,oCtrlMouse);
            oAtualP = oPaintSu;
            oPs = this;
            return(this);
        }
        public void paint(Graphics oG) {
            oAtualP = oPaintSu;
            oPs = this;
            oPaintSu.nTamanho = nTamanho;
            if (oPaintSu.nWidth !=nWidth || oPaintSu.nHeight !=nHeight) {
                oPaintSu.Size(nWidth,nHeight);
            }

            oPaintSu.SetTool(nTool);
            if (oCtrlMouse.nButton == 1) {
                oPaintSu.SetColor(oColor1);
            }
            else{
                oPaintSu.SetColor(oColor2);
            }
            oPaintSu.gGraf = (Graphics2D) oG;
            oPaintSu.paint();
            if(oCtrlMouse.lClick){oPaintSu.Draw();}
        }
     }

     //Classe de controle de toolbar de ferramentas
     private class MyToolbarTools extends JToolBar
     {

         JButton btnLapis = new  JButton(new ImageIcon("images\\lapis.png"));
         JButton btnBorracha = new JButton(new ImageIcon("images\\Borracha.png"));
         JButton btnPincel = new JButton(new ImageIcon("images\\pincel.png"));
         JButton btnBalde = new JButton(new ImageIcon("images\\Balde.png"));
         JButton btnTexto = new JButton(new ImageIcon("images\\texto.png"));
         JButton btnLupa = new JButton(new ImageIcon("images\\Lupa.png"));
         JButton btnFormas = new JButton(new ImageIcon("images\\Formas.png"));
         JButton btnRecort = new JButton(new ImageIcon("images\\Recort.png"));
         JButton btnGotas = new JButton(new ImageIcon("images\\Gotas.png"));


         public MyToolbarTools()
         {
            this.setOrientation(JToolBar.VERTICAL);
            this.setName("Ferramentas");

            btnLapis.addActionListener( ActionMenus("subLapis") );
            this.add(btnLapis);


            btnBorracha.addActionListener( ActionMenus("subBorracha") );
            this.add(btnBorracha);

            btnPincel.addActionListener( ActionMenus("subPincel") );
            this.add(btnPincel);


            btnBalde.addActionListener( ActionMenus("subBalde") );
            this.add(btnBalde);

            //btnTexto.addActionListener( ActionMenus("subTexto") );
            //this.add(btnTexto);


            //btnLupa.addActionListener( ActionMenus("subLupa") );
            //this.add(btnLupa);


            btnFormas.addActionListener( ActionMenus("subFormas") );
            this.add(btnFormas);


            //btnGotas.addActionListener( ActionMenus("subGotas") );
            //this.add(btnGotas);


            //btnRecort.addActionListener( ActionMenus("subRecort") );
            //this.add(btnRecort);



         }
     }

     private class MyToolbarColors extends JToolBar
     {
         ImageIcon oIma = new ImageIcon("images\\ColorBox.png");
         JLabel Cores = new JLabel(oIma);

        // GridLayout oLayout = new GridLayout(8,5);
       //  JPanel ColorBox = new JPanel(oLayout);

         JButton Color1 = new JButton("     ");
         JButton Color2 = new JButton("     ");
         JLabel Title1 = new JLabel("Cor 1");
         JLabel Title2 = new JLabel("Cor 2");
         
         int nMButton = 1;
         
         public MyToolbarColors()
         {
           
            Cores.addMouseListener(new MouseAdapter() {
                public void mouseClicked(MouseEvent e){

                    BufferedImage oCores = new BufferedImage(oIma.getImage().getWidth(null), oIma.getImage().getHeight(null), BufferedImage.TYPE_INT_RGB); 
                    Graphics g = oCores.createGraphics();
                    g.drawImage( oIma.getImage(), 0, 0, null);
                    g.dispose();
                    Color c = new Color(oCores.getRGB(e.getX(), e.getY()));

                    SetColor(nMButton,c );
                }

                @Override
                public void mousePressed(MouseEvent e) {
                     nMButton=e.getButton();
                }

            });
            Cores.addMouseMotionListener(new MouseMotionAdapter() {
                public void mouseDragged(MouseEvent e){
                    BufferedImage oCores = new BufferedImage(oIma.getImage().getWidth(null), oIma.getImage().getHeight(null), BufferedImage.TYPE_INT_RGB);
                    Graphics g = oCores.createGraphics();
                    g.drawImage( oIma.getImage(), 0, 0, null);
                    g.dispose();

                    Color c = new Color(oCores.getRGB(e.getX(), e.getY()));
                    SetColor(nMButton,c );
                }
            });

            this.setOrientation(JToolBar.VERTICAL);
            this.setName("Cores");

          
            Color1.addActionListener(new ActionListener(){
               public void actionPerformed( ActionEvent event){
                    SetColor(1,null);
               }
            });
            
            Color2.addActionListener(new ActionListener(){
               public void actionPerformed( ActionEvent event){
                    SetColor(2,null);
               }
            });
            
            Color1.setBorder(LineBorder.createGrayLineBorder());
            Color2.setBorder(LineBorder.createGrayLineBorder());
            
            this.add(Cores);
            
            this.add(Title1);
            this.add(Color1);
            this.add(Title2);
            this.add(Color2);
         }

         public void SetColor(int nButton,Color toColor)
         {
             if (toColor == null) {
                 toColor = JColorChooser.showDialog(this, "Escolha a cor", Color.yellow);
             }
             if (toColor != null)
             {
                 if (nButton == 1) {
                     oColor1 = toColor;
                     Color1.setBackground(oColor1);
                 }
                else{
                     oColor2 = toColor;
                     Color2.setBackground(oColor2);
                }
            }
         }
     }

     private class MyToolbarPropert extends JToolBar
     {

         //feramenta escolhida
         JLabel lblFERRAMENTA = new JLabel("Ferramenta:");
         JLabel CurrentTool = new JLabel(new ImageIcon());
         
         //controle de tamanho
         JPanel pSize = new JPanel();
         JSlider lSize = new JSlider(1,10);
         JLabel lSizeLabel =  new JLabel();
         
         //Botoes de formas
         JPanel pForms = new JPanel();
         JButton btnSquare = new JButton( new ImageIcon("images\\square.png") );
         JButton btnLine = new JButton( new ImageIcon("images\\line.png") );
         JButton btnCircle = new JButton( new ImageIcon("images\\Circle.png") );
         
         public MyToolbarPropert()
         {
             
            //configurações da toolbar
            this.setOrientation(JToolBar.HORIZONTAL);
            this.setName("Propriedades");

            //imagem ferramenta selecionada
            this.add(lblFERRAMENTA);
            this.addSeparator();
            this.add(CurrentTool);
            this.addSeparator();
            this.add( new JSeparator(SwingConstants.VERTICAL));            
           
            //botoões de formas
            pForms.add(btnLine);
            pForms.add(btnSquare);
            pForms.add(btnCircle);
            
            btnLine.addActionListener( ActionMenus("subLine") );
            btnSquare.addActionListener( ActionMenus("subSquare") );
            btnCircle.addActionListener( ActionMenus("subCircle") );
            
            add(pForms);
            pForms.setVisible(false);
            addSeparator();
            
            
            //Slider de tamanho
            pSize.add(new JLabel("Tamanho"));
            pSize.add(lSize);
            pSize.add(lSizeLabel);
            add(pSize);
            this.addSeparator();
            pSize.setVisible(false);
            
            lSize.addChangeListener(
                    new ChangeListener() {

                @Override
                public void stateChanged(ChangeEvent e) {
                    lSizeLabel.setText(String.valueOf(lSize.getValue()));
                    nTamanho = lSize.getValue();
                }
            });
            lSize.setValue(1);
            
         }

        public void SetTool(String cMenu)
        {

            String cIcon = "";               

            if (cMenu.equals("subLapis"))	{cIcon="images\\Lapis.png";}    
            if (cMenu.equals("subBorracha")){cIcon="images\\Borracha.png";}     
            if (cMenu.equals("subPincel"))	{cIcon="images\\Pincel.png";}
            if (cMenu.equals("subBalde"))	{cIcon="images\\Balde.Png";}
            if (cMenu.equals("subTexto"))	{cIcon="images\\Texto.png";}
            if (cMenu.equals("subLupa"))	{cIcon="images\\Lupa.png";}
            if (cMenu.equals("subFormas"))	{cIcon="images\\Formas.png";}
            if (cMenu.equals("subGotas")) 	{cIcon="images\\Gotas.png";}
            if (cMenu.equals("subRecort"))	{cIcon="images\\Recort.png";}

            if(cIcon.isEmpty())
            {
                return;
            }
             CurrentTool.setIcon(new ImageIcon(cIcon));

            //verifica se foi selecionado erramenta que usa tamanho
            if (cMenu.contains("subPincel") || cMenu.contains("subBorracha") || cMenu.contains("subFormas"))
               pSize.setVisible(true);
            else
                pSize.setVisible(false);                     


            if (cMenu.contains("subFormas"))
               pForms.setVisible(true);
            else
                pForms.setVisible(false);    

        }
     }
}



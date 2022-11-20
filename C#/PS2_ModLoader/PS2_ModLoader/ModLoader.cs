using System.Collections;

namespace PS2_ModLoader
{
    public partial class ModLoader : Form
    {
        OpenFileDialog openFileDialog = new OpenFileDialog();
        SaveFileDialog saveFileDialog = new SaveFileDialog();

        BinaryWriter binaryWriter;

        String directory;
        String extension;

        List<byte> FileBytes;
        List<String> ModLines;

        public ModLoader()
        {
            saveFileDialog.Filter = "Exported File |*.elf;*.ELF";
            
            InitializeComponent();
        }

        private void LoadFileButton(object sender, EventArgs e)
        {
            openFileDialog.Filter = "Base File |*.elf;*.ELF";
            openFileDialog.ShowDialog(this);

            textBox1.Text = openFileDialog.FileName;
            directory = openFileDialog.InitialDirectory;
            FileBytes = File.ReadAllBytes(openFileDialog.FileName).ToList<byte>();

            extension = Path.GetExtension(openFileDialog.FileName);
        }

        private void LoadModButton(object sender, EventArgs e)
        {
            openFileDialog.Filter = "Mod File |*.mod";
            openFileDialog.ShowDialog(this);

            textBox2.Text = openFileDialog.FileName;
            //ModBytes = File.ReadAllBytes(openFileDialog.FileName).ToList<byte>();
            ModLines = File.ReadAllLines(openFileDialog.FileName).ToList<String>();
        }

        private void SaveButton(object sender, EventArgs e)
        {
            //directory = openFileDialog.InitialDirectory;
            //FileBytes = File.ReadAllBytes(openFileDialog.FileName).ToList<byte>();

            //extension = Path.GetExtension(openFileDialog.FileName);

            FileBytes = File.ReadAllBytes(textBox1.Text).ToList<byte>();
            ModLines = File.ReadAllLines(textBox2.Text).ToList<String>();

            if (!textBox1.Equals("") && FileBytes != null)
            {
                saveFileDialog.ShowDialog();

                int count = ModLines.Count()/2;
                
                for(int v=0; v<count; v++){
                    //Console.Write("test");
                    int index = Int32.Parse(ModLines[v*2].Substring(1));

                    if (ModLines[2*v][0] == 's')
                        for (int i = index; i < index + ModLines[2*v+1].Length; i++)
                            FileBytes[i] = (byte)ModLines[2*v+1][i - index];

                    else if (ModLines[2*v][0] =='a')
                        for (int i = index; i < index + ModLines[1].Length; i++)
                            FileBytes.Insert(i, (byte)ModLines[2 * v + 1][i - index]);
                }



                binaryWriter = new BinaryWriter(new FileStream(saveFileDialog.FileName, FileMode.Create));
                binaryWriter.Write(FileBytes.ToArray());

                binaryWriter.Close();
            }
        }
    }
}
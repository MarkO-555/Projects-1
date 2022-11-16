using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
//using bpac;
using Timer = System.Windows.Forms.Timer;

namespace SerialGen
{

    public partial class SerialGenForm : Form
    {
        public static JObject jsonObj;
        public static AddProductForm newProductForm;
        public static bool update = false;
        public static string FileName = "Items.json";
        int IntLimit = 2000000000;

        //string LabelTemplate = "Serialtemplate.LBX";

        //JObject jobj;
        int first = 0;
        int count = 0;
        int last = 0;
        string lotnum = "";
        //Form2 newProduct;
        Timer timer;

        public SerialGenForm()
        {
            InitializeComponent();
        }

        private string Selected = "";

        private void TimerTick(System.Object myObject,EventArgs myEventArgs) {
            if (update){
                timer.Stop();

                clearlistBox();
                populatelistBox();

                timer.Start();
                update = false;
            }
        }

        private void OnFormLoad(object sender, EventArgs e){
            count = (int)numericUpDown1.Value;
            timer = new Timer();
            timer.Interval = 100;
            timer.Tick += new EventHandler(TimerTick);

            timer.Start();

            

            newProductForm = new AddProductForm();
            Selected = "";

            populatelistBox();
        }

        private void SelectedProductChanged(object sender, EventArgs e){
            count = (int)numericUpDown1.Value;
            try{
                first = jsonObj.GetValue(listBox1.Text).Value<int>()+1;

                Selected = listBox1.Text;
                last = first + (count-1);

                label2.Text = first + " -> " + last;
            }
            catch(Exception ext){}
        }

        private void Generate(object sender, EventArgs e){
            richTextBox1.Text = "";

            count = (int)numericUpDown1.Value+1;
            if (first + count < IntLimit)
            {
                last = count - 1;
                //last += (count-1);

                if (first >= last)
                    last = first;

                label2.Text = first + " -> " + last;

                string str = "";
                string lastStr = "";

                for (var i = 0; i < count - 1; i++)
                {
                    lastStr = "" + ((first) + i);

                    while (lastStr.Length < 4)
                        lastStr = "0" + lastStr;

                    str += lotnum + "-" + lastStr + " ";
                }

                richTextBox1.Text = str;
                Clipboard.SetText(str);
            }
            else
                MessageBox.Show("SerialNumber To High, Max Is "+IntLimit);
        }

        private void NewProductOpen(object sender, EventArgs e)
        {
            newProductForm.Visible = true;
        }

        void populatelistBox()
        {
            using (StreamReader r = new StreamReader(FileName))
            {
                string text = r.ReadToEnd();
                jsonObj = JObject.Parse(text);

                JToken t = jsonObj.First;
                for (int i = 0; i < jsonObj.Count; i++)
                {
                    listBox1.Items.Add(t.Path);

                    //Names.Add(t.Path);
                    //serials.Add(jobj.GetValue(t.Path).Value<int>());

                    t = t.Next;
                }
            }
        }

        void clearlistBox()
        {
            for (int i = 0; i < listBox1.Items.Count + 1; i++)
            {
                listBox1.Items.RemoveAt(0);
            }
        }

        private void Save(object sender, EventArgs e){

            JToken t = jsonObj.First;
            for (int i = 0; i < SerialGenForm.jsonObj.Count; i++)
            {

                if (t.Path.Equals(Selected)){
                    //set json value to last!!!
                    jsonObj.Remove(t.Path);
                    jsonObj.Add(Selected, last);

                    File.WriteAllText(FileName, JsonConvert.SerializeObject(jsonObj));

                    clearlistBox();
                    populatelistBox();

                    break;
                }
                t = t.Next;
            }
        }

        private void OnLotNumberChange(object sender, EventArgs e){
            lotnum = textBox1.Text;
        }
    }
}
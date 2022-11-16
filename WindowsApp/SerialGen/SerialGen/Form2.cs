using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SerialGen
{
    public partial class AddProductForm : Form
    {


        public AddProductForm()
        {
            InitializeComponent();
        }

        private void OnFormLoad(object sender, EventArgs e){

        }

        private void OnFormClosed(object sender, FormClosedEventArgs e)
        {
            SerialGenForm.newProductForm = new AddProductForm();
            SerialGenForm.newProductForm.Visible = false;
        }

        private void OnAddButton(object sender, EventArgs e)
        {
            //Form1.serials.Add((int)numericUpDown1.Value);
            //Form1.Names.Add(textBox1.Text);

            Boolean pass = true;

            JToken t = SerialGenForm.jsonObj.First;
            for (int i = 0; i < SerialGenForm.jsonObj.Count; i++){
                if (t.Path.Equals(this.textBox1.Text))
                    pass = false;
                t = t.Next;
            }

            if (pass)
            {
                SerialGenForm.jsonObj.Add(textBox1.Text, (int)numericUpDown1.Value);
                SerialGenForm.update = true;

                File.WriteAllText(SerialGenForm.FileName, JsonConvert.SerializeObject(SerialGenForm.jsonObj));
            }
            else
                MessageBox.Show("This Product already exists");

            this.textBox1.Text = "";
            this.numericUpDown1.Value = 0;

            


            this.Visible = false;
        }

    }
}

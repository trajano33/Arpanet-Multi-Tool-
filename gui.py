import tkinter as tk
import cpfutil

root = tk.Tk()


def validate_cpf(stringvar: tk.StringVar, button: tk.Button):
    cpf = stringvar.get()

    if cpfutil.is_valid(cpf):
        button.config(
            text='OK', activeforeground='green', foreground='green'
        )
    else:
        button.config(
            text='Inválido', activeforeground='red', foreground='red'
        )


def generate_cpf(stringvar: tk.StringVar, button: tk.Button):
    cpf = cpfutil.generate()
    cpf_formatado = cpfutil.formater(cpf)
    stringvar.set(cpf_formatado)


main_title = tk.Label(
    root,
    text='Gerador/Validador de CPF',
    bg='#fff',
    font=('Helvetica', 12, 'bold')
)
main_title.grid(row=0, column=0, columnspan=3, pady=(0, 20))

validate_label = tk.Label(root, text='Validar:', bg='#fff',)
validate_label.grid(row=1, column=0)

validate_stringvar = tk.StringVar()
validate_entry = tk.Entry(
    root,
    bd=5,
    relief='flat',
    textvariable=validate_stringvar
)
validate_entry.grid(row=1, column=1, pady=10)

validate_button = tk.Button(root, text='Validar')
validate_button.grid(row=1, column=2, sticky='we')
validate_button.configure(command=lambda: validate_cpf(
    validate_stringvar, validate_button
))

validate_label = tk.Label(root, text='Gerar:', bg='#fff',)
validate_label.grid(row=2, column=0)

generate_stringvar = tk.StringVar()
generate_entry = tk.Entry(
    root,
    bd=5,
    relief='flat',
    textvariable=generate_stringvar
)
generate_entry.grid(row=2, column=1, pady=10)

generate_button = tk.Button(root, text='Gerar')
generate_button.grid(row=2, column=2, sticky='we')
generate_button.configure(command=lambda: generate_cpf(
    generate_stringvar, validate_button
))


root.title('Gerador/Validador de CPF')
root.config(background='#fff', padx=20, pady=20)
root.mainloop()

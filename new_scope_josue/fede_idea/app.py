import streamlit as st

# Agrega el CSS para colocar el texto debajo del checkbox
st.markdown("""
    <style>
    .checkbox-container {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .checkbox-container label {
        margin-top: 5px;
        text-align: center;
    }
    </style>
    """, unsafe_allow_html=True)

# Crea columnas con checkboxes y texto debajo
cols = st.columns([1 for i in range(30)])
for num, col in enumerate(cols):
    with col:
        # Añade HTML para checkbox y label
        st.markdown(
            f"<div class='checkbox-container'><input type='checkbox' id='checkbox{num}'><label for='checkbox{num}'>{num}</label></div>",
            unsafe_allow_html=True
        )

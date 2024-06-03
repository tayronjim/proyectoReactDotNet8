import 'bootstrap/dist/css/bootstrap.min.css'
import {useState,useEffect} from "react";

export function ListaTareas(){
    const [tareas, setTareas] = useState([])
    const [descripcion, setDescripcion] = useState("")

    const mostrarTareas = async ()=>{
        const response = await fetch("/api/tareas/lista");
        if(response.ok){
            const data = await response.json()
            setTareas(data)
        }else{
            console.log("Error status: " + response.status)
        }
    }

    const guardarTarea = async (e)=>{
        e.preventDefault()

        const result = await fetch("/api/tareas/Guardar",{
            method:"POST",
            headers:{
                "Content-Type" : 'application/json;charset=utf-8'
            },
            body:JSON.stringify({descripcion:descripcion})
        })
        if(result.ok){
            setDescripcion("")
            await mostrarTareas()
        }
    }

    const borrarTarea = async (id)=>{

        const result = await fetch("/api/tareas/Cerrar/" + id,{
            method:"DELETE",
        })
        if(result.ok){
            await mostrarTareas()
        }
    }

    useEffect(()=>{
        mostrarTareas()
    },[])
    return <div>
        <h2 className="">Lista Tareas</h2>
        <div className="row">
            <div className="col-sm-12">
                <form onSubmit={guardarTarea}>
                    <div className="input-group">
                        <input type="text" value={descripcion} onChange={(e)=>{setDescripcion(e.target.value)}} className="form-control" placeholder="ingresa descr" />
                        <button className="btn btn-success" type="submit">Agregar</button>
                    </div>
                </form>
            </div>
        </div>
        <div className="row mt-4">
            <div className="col-sm-12">
                <div className="list-group">
                    {tareas.map((t,i)=>(
                        
                        <div key={i} className="list-group-item list-group-item-action">
                            {console.log(t)}
                            <h5 className="text-primary">{t.descripcion}</h5>
                            <div className="d-flex justify-content-between">
                                <small className="text-muted">{t.fechaRegistro}</small>
                                <button className="btn btn-sm btn-outline-danger" onClick={()=>{borrarTarea(t.idTarea)}}>Cerrar</button>
                            </div>
                        </div>
                        
                    ))}
                </div>
            </div>
        </div>
        <div><ul>
            
            </ul>
        </div>
        </div>
}
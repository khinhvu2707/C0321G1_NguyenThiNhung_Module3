package model.service.attachService;

import model.bean.AttachService;
import model.repository.attachService.AttachServiceRepository;

import java.util.List;

public class AttachServiceService {
    private AttachServiceRepository attachServiceService = new AttachServiceRepository();

    public List<AttachService> selectAllAttachServices() {
        return attachServiceService.findAll();
    }

    public AttachService selectAttachServiceByID(int id) {
        return attachServiceService.findById(id);
    }

}

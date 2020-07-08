package com.project.bit.dashBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bit.dashBoard.domain.IssueStatusCountVO;
import com.project.bit.dashBoard.domain.MonthlyProjectCountVO;
import com.project.bit.dashBoard.domain.ProjectStatusCountVO;
import com.project.bit.dashBoard.domain.ProjectStatusVO;
import com.project.bit.dashBoard.domain.ProjectTypeCountVO;
import com.project.bit.dashBoard.mapper.DashBoardAllMapper;
import com.project.bit.project.domain.ProjectDTO;

@Service
public class DashBoardAllServiceImpl implements DashBoardAllService {

    @Autowired
    private DashBoardAllMapper dashBoardAllMapper;

    @Override
    public List<ProjectStatusVO> getProjectAllStatusCount() {
        return dashBoardAllMapper.selectProjectAllStatusCount();
    }

    @Override
    public List<IssueStatusCountVO> getIssueAllStatus() {
        return dashBoardAllMapper.selectIssueAllStatus();
    }
    @Override
    public List<ProjectStatusCountVO> getProjectAllStatus() {
        return dashBoardAllMapper.selectProjectAllStatus();
    }
    @Override
    public List<MonthlyProjectCountVO> getMonthlyProject() {
        return dashBoardAllMapper.selectMonthlyProjectStatus();
    }
    @Override
    public List<ProjectDTO> getKeyProject() {
        return dashBoardAllMapper.selectKeyProject();
    }

	@Override
	public List<ProjectTypeCountVO> getProjectAllType() {
		// TODO Auto-generated method stub
		return dashBoardAllMapper.selectProjectAllType();
	}
}